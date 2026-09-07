Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C43DC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BDhNx6T7nc+YilNr/gP5RkiGsPYaJuQR8YZHHWYGhrY=; b=Ou180rXfbhfN5MP1KLkfqHmRN5
	IL8kFprF4ybM6ov3U0iuv2rtVl0B5hbxtAgYC4FoWvO2quszzWTjz8PErVIS1A+OEkqzG2Qj+rpBh
	+QyofIt98acLOmFmzG08Y1qI5ktAPNZNku5vUUTOD4ZkD9uAoUZUC2etLulSfnD5iVhxVjs5JMvT+
	qZ3cKQt0QQgP+PbZ9DTadEyIzc+/3wSRgXutvuMtYFh7PitwagxrO3BZOYq+BXZGufZN7QaLYQ/Hr
	io4PdXUHLt55GLoDvykasbIT1L4dkiN7PskoUo8Z5ceqx5Yyce9PhrT/s4tqInIu5kDkg+SLozBoH
	BxaBu02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0Q-00000007SuN-1b6I;
	Mon, 07 Sep 2026 17:19:42 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0N-00000007StD-1vfF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:19:40 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-485835753caso2935011f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 10:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801577; x=1789406377; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BDhNx6T7nc+YilNr/gP5RkiGsPYaJuQR8YZHHWYGhrY=;
        b=b/Fgx10WRT7jULE6OmcbYL//TXPH2UPsdCAplh2+KsLWJlfBYI2ikKieVxezPJL4fr
         EI8WspOlKITlM2MPJwq2h4OLhqYJ9y6haeIYnyYjB/I03G/50mAvE0w+xFC+IHphtlYY
         mCWzY7XnQFKLXCgC1LGrL6GoT0zG5FRTijls9R9ot+AN5gT6FNuSv616P+iv9HRDRPn8
         SVYIrOm3PLsY20xiQ1UnCbECIbQjoV34tHrTTwn6mjKBdaS8U9gGx7igLbELF9MZEMQJ
         dom3m9yKTP9uoQWTCT04s9YPNuQGFdVfB+1CxVLazb5DycND2DmNBL3tTg2ghgP7PCZN
         3maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801577; x=1789406377;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDhNx6T7nc+YilNr/gP5RkiGsPYaJuQR8YZHHWYGhrY=;
        b=rvESPcjAtKvDubt+4oHxVxUxdVa/J7IU7h3CB/nJeOdCshctOeJBYlnyWdUZ6l9b+O
         mfBlsyGxXIWCBVjD/+nnRD2KldeHwbbj5993pnroIDCroOtUnJlzDnszhWxiQqVCwyVW
         k07IehnHNnvs0ju5SQT/buWDxXRFIM3EYrAeWC0m13dJZyn2jYtMIvyNzWesDzguGD52
         S5tHIyErfSrx1ohusf7bYYXiliTZy85ahx8FBHFjQJ1CHzkBr1F0G5cxrpJwA8dGRp4N
         TYgjw6zgtN4PPpZb9NPiiAAuzF8/CQ6z8/Sb+Rnl+f8eL/rSuyC2Hb80+Gsv2pKWL6Q4
         LYhg==
X-Forwarded-Encrypted: i=1; AKwUvBwbM9UBU2yOdB9bXJQykR4dR7+IFQgmRsg3TRWejjpfotkP9UUHqjwXjrgwNd9LUl3Gk4D156aRRYje2Fmt98GD@lists.infradead.org
X-Gm-Message-State: AFuF++lhzsgj9u7JbfasNPzgl/GyGDc/pnJ/mbwKi9C10hsaMeNtrQ1f
	VwcijD+GL7DdLVC7KK4Cd39lhpJ106itcJxA05u3PiEjw4Rmx6JTzonrSdw6XYbBQJDfeC+I6zK
	jvOa2DIALRvfNwP/XUhUhEnQBPtFSFw==
X-Received: from wrqe18.prod.google.com ([2002:a5d:6d12:0:b0:484:3a05:4b1])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4304:b0:484:3311:3702 with SMTP id ffacd0b85a97d-485872db94cmr27152632f8f.25.1788801576435;
 Mon, 07 Sep 2026 10:19:36 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:22 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-1-sebastianene@google.com>
Subject: [PATCH v9 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_101939_547889_5EA2335D 
X-CRM114-Status: GOOD (  20.88  )
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

Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
FF-A proxy. This restriction was preventing the use of asynchronous
signaling mechanisms defined by the Arm FF-A specification to
communicate with the secure services.
While these calls are markes as optional, there is no reason why the
hypervisor proxy would block them because:

1. Host is the Sole Non-Secure Endpoint: The Host operates as the
   only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
   Because all forwarded notifications are inherently attributed to
   the Host by the SPMC, there is no risk of VM ID spoofing
   originating from the Normal World.

2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
   operate strictly via register-based parameters, passing only
   VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
   not contain memory addresses, offsets, or pointers, forwarding
   them doesn't pose a risk of memory-based confused deputy attack
   (e.g., tricking the SPMC into overwriting protected memory).

The pKVM proxy behaves as a relayer and it doesn't currently have its
own FF-A ID(only the host has the ID 0). The behavior of the setup
flow is covered by the spec in the: '10.9 Notification support without
a Hypervisor'.

While at it, enforce the MBZ/SBZ fields defined by the spec to prevent
odd behavior when a new version starts making use of the reserved
registers.

---
v9:
- rebased on 7.3-rc2
- no other changes

v8:
- rebased on 7.2-rc3
- no other changes

Changes in v7:
- rebased on 7.2-rc1
- collected the Ack from Will
- check for major version as well when doing the SBZ/MBZ enforcement

Changes in v6:
- applied Will's feedback and re-ordered the patch series so that we
  apply the MBZ enforcement at the end of the series
- update ffa_check_unused_args_sbz so that we take into account the FF-A
  version because the spec changed the list of unused parameter registers
  for 64-bit SMCs from v1.1 to v1.2

Changes in v5:
- handle 32-bit smc variants correctly when doing the MBZ enforcement
- add check for FFA_FEATURES
- handle missing FFA_FN64_NOTIFICATION_INFO_GET
- collected the Review tags from Vincent, thank you 

Changes in v4:
- previous series(v3) had serious issues with the patch number and it
  appeared like it used a mixed bag from v2 as well. Resend this to
  restore the correct order of the patches.
- fix strict check in ffa_check_unused_args_sbz and make it "<= 17"
- check the receiver endpoint Id in
  FFA_NOTIFICATION_BIND/FFA_NOTIFICATION_UNBIND instead of the sender
- use hyp_smccc_1_2_smc all along 
- check the receiver endpoit Id when doing FFA_NOTIFICATION_GET  

Changes in v3:
- applied Will's suggestion to use the introduced method
  ffa_check_unused_args_sbz for existing calls and added a new
patch in the beggining of the series to do this.
- merged the handling of
  FFA_NOTIFICATION_BITMAP_CREATE/FFA_NOTIFICATION_BITMAP_DESTROY into
one patch as Vincent suggested and create one handler for both.

Changes in v2:
- enforce the MBZ/SBZ fields
- split the calls into separate patches
- rebase on 7.1-rc7

v8:
https://lore.kernel.org/all/20260729121306.1519473-2-sebastianene@google.com/
v7:
https://lore.kernel.org/all/20260629093558.2425257-1-sebastianene@google.com/
v6:
https://lore.kernel.org/all/20260626074545.433234-1-sebastianene@google.com/
v5:
https://lore.kernel.org/all/20260623115354.632361-1-sebastianene@google.com/
v4:
https://lore.kernel.org/all/20260616154149.2763214-1-sebastianene@google.com/
v3:
https://lore.kernel.org/all/20260616105417.2578670-1-sebastianene@google.com/
v2:
https://lore.kernel.org/all/20260608165549.1479409-1-sebastianene@google.com/
v1:
https://lore.kernel.org/all/20260501114447.2389222-2-sebastianene@google.com/

Sebastian Ene (7):
  KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
  KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
  KVM: arm64: Enforce strict SBZ checks in the FF-A proxy

 arch/arm64/kvm/hyp/nvhe/ffa.c | 220 ++++++++++++++++++++++++++++++++--
 1 file changed, 212 insertions(+), 8 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog


