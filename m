Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AFCC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 23:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F2fG0i25TDQiWGtI7DQglXAnLSOL4mMbFNlfNGu1LF0=; b=iJw2NF+IWmbGwTHR4NveDzR8Ax
	dLrBBMsX0Uj+l6QGIh8ogELpU6t+vcRJSu96wuPWqZ87Q0PZI1EiIfOOwgqxzwTFLfGGUJQ+hpNbn
	Iy99hgiW7Y4Dg4AejhmznFKqGaxzzXUCBzfzwF9inBV7zb7/TslQ7KmDzIER9mVEmmO5hhAhlvd1H
	vhs4UBcvalzdqwsmDC7FUFmX1OVLaithUx5KFhRVwsOhfta5ze6FYF5S9wDPg3DujnhhnlHQjQWzZ
	q8KjmPkoYRxBacACvUUmi3lwDo7uDHuu48qn+hiKq0Ef5xUPRXvUIpdG4+F+/4Y0h2Tk/HBMAqpDZ
	8ii3z5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEFqA-000000080TH-2INC;
	Sun, 11 May 2025 23:12:14 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEFm6-00000007zkd-3ORS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 23:08:04 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.1.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7450C211D8B8;
	Sun, 11 May 2025 16:08:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7450C211D8B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1747004880;
	bh=F2fG0i25TDQiWGtI7DQglXAnLSOL4mMbFNlfNGu1LF0=;
	h=From:To:Cc:Subject:Date:From;
	b=aLRNYtL5kOBG3kGB6vZIhQl85AE/5qTPeARbyiDUbcSGHdhJVf2jmf2pbe6r3fddL
	 td4n6rD5jiHRC9nqxXO71MULvNvKGoZRsEKo/osnBcF119vuO5NeC3PA1dMDIpy+Nj
	 1J41XBLPsuhdCyDHIG1GEKQFjj0Ku6AAt207kXtU=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bp@alien8.de,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	kys@microsoft.com,
	mingo@redhat.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	x86@kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v2 0/4] Confidential VMBus
Date: Sun, 11 May 2025 16:07:54 -0700
Message-ID: <20250511230758.160674-1-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_160802_902022_7478DE1B 
X-CRM114-Status: GOOD (  18.87  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The guests running on Hyper-V can be confidential where the memory and the
register content are encrypted, provided that the hardware supports that
(currently support AMD SEV-SNP and Intel TDX is implemented) and the guest
is capable of using these features. The confidential guests cannot be
introspected by the host nor the hypervisor without the guest sharing the
memory contents upon doing which the memory is decrypted.

In the confidential guests, neither the host nor the hypervisor need to be
trusted, and the guests processing sensitive data can take advantage of that.

Not trusting the host and the hypervisor (removing them from the Trusted
Computing Base aka TCB) ncessitates that the method of communication
between the host and the guest be changed. Below there is the breakdown of
the options used in the both cases (in the diagrams below the server is
marked as S, the client is marked as C):

1. Without the paravisoor the devices are connected to the host, and the
host provides the device emulation or translation to the guest:

+---- GUEST ----+       +----- DEVICE ----+        +----- HOST -----+
|               |       |                 |        |                |
|               |       |                 |        |                |
|               |       |                 ==========                |
|               |       |                 |        |                |
|               |       |                 |        |                |
|               |       |                 |        |                |
+----- C -------+       +-----------------+        +------- S ------+
       ||                                                   ||
       ||                                                   ||
+------||------------------ VMBus --------------------------||------+
|                     Interrupts, MMIO                              |
+-------------------------------------------------------------------+

2. With the paravisor, the devices are connected to the paravisor, and
the paravisor provides the device emulation or translation to the guest.
The guest doesn't communicate with the host directly, and the guest
communicates with the paravisor via the VMBus. The host is not trusted
in this model, and the paravisor is trusted:

+---- GUEST ------+                                   +-- DEVICE --+
|                 |                                   |            |
| +- PARAVISOR -+ |                                   |            |
| |             ==+====================================            |
| |   OpenHCL   | |                                   |            |
| |             | C=====================              |            |
+-+---- C - S --+-+                   ||              +------------+
        ||  ||                        ||
        ||  ||      +-- VMBus Relay --||--+           +--- HOST ---+
        ||  ||=======   Interrupts, MMIO  |           |            |
        ||          +---------------------+           +---- S -----+
        ||                                                  ||
+-------||----------------- VMBus --------------------------||------+
|                     Interrupts, MMIO                              |
+-------------------------------------------------------------------+

Note that in the second case the guest doesn't need to share the memory
with the host as it communicates only with the paravisor within their
partition boundary. That is precisely the raison d'etre and the value
proposition of this patch series: equip the confidential guest to use
private (encrypted) memory and rely on the paravisor when this is
available to be more secure.

I'd like to thank the following people for their help with this
patch series:

* Dexuan for help with validation and the fruitful discussions,
* Easwar for reviewing the refactoring of the page allocating and
  freeing in `hv.c`,
* John and Sven for the design,
* Mike for helping to avoid pitfalls when dealing with the GFP flags,
* Sven for blazing the trail and implementing the design in few
  codebases.

I made sure to validate the patch series on

    {TrustedLaunch(x86_64), OpenHCL} x
    {SNP(x86_64), TDX(x86_64), No hardware isolation, No paravisor} x
    {VMBus 5.0, VMBus 6.0} x
    {arm64, x86_64}.

[V2]
    - The patch series is rebased on top of the latest hyperv-next branch.
  
    - Better wording in the commit messages and the Documentation.
    **Thank you, Alok and Wei!**

    - Removed the patches 5 and 6 concerning turning bounce buffering off from
      the previous version of the patch series as they were found to be
      architecturally unsound. The value proposition of the patch series is not
      diminished by this removal: these patches were an optimization and only for
      the storage (for the simplicity sake) but not for the network. These changes
      might be proposed in the future again after revolving the issues.
    ** Thanks you, Christoph, Dexuan, Dan, Michael, James, Robin! **

[V1] https://lore.kernel.org/linux-hyperv/20250409000835.285105-1-romank@linux.microsoft.com/

Roman Kisel (4):
  Documentation: hyperv: Confidential VMBus
  drivers: hyperv: VMBus protocol version 6.0
  arch: hyperv: Get/set SynIC synth.registers via paravisor
  arch: x86, drivers: hyperv: Enable confidential VMBus

 Documentation/virt/hyperv/vmbus.rst |  41 +++
 arch/arm64/hyperv/mshyperv.c        |  19 ++
 arch/arm64/include/asm/mshyperv.h   |   3 +
 arch/x86/include/asm/mshyperv.h     |   3 +
 arch/x86/kernel/cpu/mshyperv.c      |  51 ++-
 drivers/hv/channel.c                |  36 ++-
 drivers/hv/channel_mgmt.c           |  29 +-
 drivers/hv/connection.c             |  10 +-
 drivers/hv/hv.c                     | 485 ++++++++++++++++++++--------
 drivers/hv/hyperv_vmbus.h           |   9 +-
 drivers/hv/ring_buffer.c            |   5 +-
 drivers/hv/vmbus_drv.c              | 152 +++++----
 include/asm-generic/mshyperv.h      |   1 +
 include/linux/hyperv.h              |  71 ++--
 14 files changed, 677 insertions(+), 238 deletions(-)


base-commit: 9b0844d87b1407681b78130429f798beb366f43f
-- 
2.43.0


