Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315D4E7DF0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 17:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLJBzF8XMNLAElcGlGb8b7F08g/dPrSHSPMb9dnbOA4=; b=lFQfacLTuwUzZ3ko0KuzyV947/
	9VShuej+jScw1zyMgVy3+DrzkglukhNmlYpZmsSKDFJJwYMl0IC2VJ0emL2w4B09cce7SILHub5z2
	VJgKXR9BYgHut9TN7Y0Ms6Hw4IN9jgE4RZ34SslJUqzKFmhrcRMNtDz9ROpqY6UN7R8bgj2DRkqOv
	z1c/dZtfb9/A4UsiIEW9Fy38kcuxzATD1YtR5D+d6DzpFm51gaBX8JZkF0m2HqIN4cYPDU2vdWi+z
	hSkW/btTHlgyjRivtauQj3tu4s8iOEmoEVNH3+h6aCGDtvVShiXGxCeLYeNP4LQBmj/MEAvFmyJt6
	gv9gXIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmy71-00000005OBm-1YeT;
	Mon, 02 Feb 2026 17:53:23 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmy6y-00000005OBQ-38If
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 17:53:22 +0000
DKIM-Signature: a=rsa-sha256; b=QfW1jbjatg2bVdWxDvuz5A/nLWLsTXHi7UxA9Q21rB27IhSdYu3WJD+dr3KUFitWvEIcjvbhqO6gmjZuhEqelZoOkv8Vr0bZX9vPYhYZX9PnZUK3oQ4KNB3sdDnO+ZgCrqVoLtIi+Vl/mKbVkz4YZKAWHxgHk8ouRCIZULTgOd9Nk6sKSASnnWEM6fUqNUTA8a7IR4hArRyFS6kaJC1rKfC7rmLQM+uVbm7CkRj+yaNXKhkH5uR/3RjP16NnBWqW2zFBjygi5D+42DAQ7x2N43deYb/KJQ5rEFpKNzElhSrsohYcLKYkmBZiJYdV3bub18ZUQLftE45fgYSKWt/vRA==; s=purelymail2; d=purelymail.com; v=1; bh=7kxye65VCI+h5vlPs0yvkT/19UOY1PNPUa2UQ4bXrDo=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -938854233;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 02 Feb 2026 17:52:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1vmy67-00000007HHQ-3gE8;
	Mon, 02 Feb 2026 18:52:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,  Vincenzo Frascino
 <vincenzo.frascino@arm.com>,  Liam Girdwood <lgirdwood@gmail.com>,
  linux-sound@vger.kernel.org,  Jaroslav Kysela <perex@perex.cz>,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  Michal Simek <michal.simek@amd.com>,  Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
In-Reply-To: <06b3d7e0-27b5-433c-85db-23e4c5ef5472@sirena.org.uk> (Mark
	Brown's message of "Thu, 29 Jan 2026 18:46:23 +0000")
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
	<20260129172315.3871602-3-sean.anderson@linux.dev>
	<700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
	<a95d7feb-4d94-4b25-be96-c7c367342c19@linux.dev>
	<a17602f1-537e-46e6-a85d-8a005a0443a2@sirena.org.uk>
	<21a738e6-6585-4479-b797-f8b17df91aed@linux.dev>
	<06b3d7e0-27b5-433c-85db-23e4c5ef5472@sirena.org.uk>
Date: Mon, 02 Feb 2026 18:52:27 +0100
Message-ID: <87jywvvxr8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_095320_868757_C07AC1E3 
X-CRM114-Status: GOOD (  15.88  )
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

>>>>> "Mark" == Mark Brown <broonie@kernel.org> writes:

Hi,

 >> and go "Ah, there are the properties I need." On some Xilinx cores this
 >> is the only way to discover certain properties, so people have gotten into
 >> the habit of using them even when these properties can be read from the
 >> device itself.

 > Oh.  If the properties are there it's reasonable and sensible to use
 > them, them being redundant is a concern when specifying the binding but
 > once things are there any discrepency should usually be resolved in
 > favour of the binding.

I also think making the hardware registers take priority over the DTS
makes sense (E.G. what this patch does), as the DTS can get out of sync
with the (programmable) HW configuration if the FPGA config is changed
and a DTS update is forgotten.


 >> I would rather remove it for the code size reduction and simplication.

 > We're talking a couple of function calls with no error handling here,
 > I'm not sure anyone concerned about that kind of impact is running
 > Linux.

Agreed, but the HW registers should by definition always be in sync with
the IP block configuration, where the DTS update involves a manual
update so it may not, so the HW registers are more reliable than the DTS.

-- 
Bye, Peter Korsgaard

