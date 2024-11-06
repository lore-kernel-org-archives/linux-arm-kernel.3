Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9FCD59F56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 17:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rVlTN5a4Ubj2gy/0pJErQ0ykortaPfqr9ns2c09AyB0=; b=DJ0V/3YaIid59un1xqx+oCy/rq
	4jV5TPQuJQ2B824OU2igevBn4LmUmtuZVfANqv/+oMReGiP4BSWfoH+aPiW+Iaiq5BV9g9wPKYv9N
	oOdfTQLd19up6MkMLzSfkV3/1lzUT5cR9KOQ41fb2w50dEBIS+1jhiECP7KsSDLn0WTHWxcN10GTL
	KlqnBn+GcGy1arsAZQAemi2FVCmj+EUS1MNwcJaLBRDFWZsqZxdo55YiFmcGzjELcBDZVb4LnJ5VK
	9mXl2neUtesyYCSBqaSzZhBV9zEpck3gbOpk19O2HtbEwFYvfzmckxWGshJw6Qaelvp5dKmCyPwEr
	LvXQcOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8k7x-00000004EVV-2k9m;
	Wed, 06 Nov 2024 17:47:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8k5o-00000004EBj-1TDy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 17:45:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 108F05C2780;
	Wed,  6 Nov 2024 17:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175A9C4CEC6;
	Wed,  6 Nov 2024 17:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730915119;
	bh=4hI5vTzKe6h+64EipIsPRN3WM31BsmB5rIzxFxXmrcM=;
	h=From:Date:Subject:To:Cc:From;
	b=Xp0JQOxUM8tiNHv49Avg3KvXMij3Sz2uB58vmTu3GzENRfQOCbJYBy6ysQKXd3Qle
	 jQRh+1Z1YUu+T/2CcaM6kxUX6vfCLUeueasQfhJfgilu9xDA4IKdcoXkNVc5xKty1M
	 9xoNw35t4CL/6GTn5W8yI7COeD29SI4xOuXUwVTeqz7ok6vptiv5XfsVVjRFFIMtt/
	 G1HBNz606HZDHoD65bG3Ef6xaXoSsuG0bd6flZ8ZRnZiElCo1GP+gE5aHEbXCVZoCl
	 XA6XuTdmMx1Qg+XYIgMFPBFV8GMxOVlpi957pZJ90ygOIKaawKKidSvOYorJb/eiqi
	 I1oRHCYKrxhvA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 06 Nov 2024 17:41:32 +0000
Subject: [PATCH] arm64/ptrace: Clarify documentation of VL configuration
 via ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-arm64-sve-ptrace-vl-set-v1-1-3b164e8b559c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEuqK2cC/x3MQQqDQAxG4atI1g0Yq0J7FelinPnVQKuSyFAQ7
 96hy2/x3kkOUzg9q5MMWV23tUBuFcUlrDNYUzE1ddOK1MLBPn3LnsH7YSGC85sdB6exuyOkcYo
 PoVLvhkm///Pwuq4f56rUi2kAAAA=
X-Change-ID: 20241101-arm64-sve-ptrace-vl-set-db53eadbfc91
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Oleg Nesterov <oleg@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=3892; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4hI5vTzKe6h+64EipIsPRN3WM31BsmB5rIzxFxXmrcM=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhnTt1dpJH/3n8YT2XzdrO2/A3byD0Texw26xadTGysIvYsVh
 WfqdjMYsDIxcDLJiiixrn2WsSg+X2Dr/0fxXMINYmUCmMHBxCsBEiuPY//ueOuCV5+JTZrr8aujm+l
 3My8o+OBYxzAmQtdD0v1ju3zBxik4Z19afp6vPLpdfYXIxMyZGW7aH61zmAdHLEiv15DIaQuRuxUrY
 TfoqvtAg6lLCw4DTObcqj7DxWD6Y3f+9ukVAWcPm4PNe3Y/uhiejWwTS39x75PBLor/jfOBy3VvXIl
 7E3Sy3NWfzCOWe8GjB/O1ZBtaK/02S1V+uWmBaoR7xe37lGpVrDyaV8nw/W8tV1CG3couguXiNytuN
 gdGNf868WK8bu05N1rU+KMa/4dHDZ/xTpzyu5zTgf9h7J/zVtiUv/n7/n5QdKsB/68ivKN/+ZrGSl5
 wVP+T+a39nWS6Tnna7csrlqBQFAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_094520_508724_46AE9253 
X-CRM114-Status: GOOD (  19.08  )
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

When we configure SVE, SSVE or ZA via ptrace we allow the user to configure
the vector length and specify any of the flags that are accepted when
configuring via prctl(). This includes the S[VM]E_SET_VL_ONEXEC flag which
defers the configuration of the VL until an exec(). We don't do anything to
limit the provision of register data as part of configuring the _ONEXEC VL
but as a function of the VL enumeration support we do this will be
interpreted using the vector length currently configured for the process.

This is all a bit surprising, and probably we should just not have allowed
register data to be specified with _ONEXEC, but it's our ABI so let's
add some explicit documentation in both the ABI documents and the source
calling out what happens.

The comments are also missing the fact that since SME does not have a
mandatory 128 bit VL it is possible for VL enumeration to result in the
configuration of a higher VL than was requested, cover that too.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/sme.rst |  4 ++++
 Documentation/arch/arm64/sve.rst |  4 ++++
 arch/arm64/kernel/ptrace.c       | 12 ++++++++++--
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/arm64/sme.rst b/Documentation/arch/arm64/sme.rst
index be317d457417434c24811edce3ef2bad88f2cace..b2fa01f85cb5e33350c59f752aba9248e4fbd80e 100644
--- a/Documentation/arch/arm64/sme.rst
+++ b/Documentation/arch/arm64/sme.rst
@@ -346,6 +346,10 @@ The regset data starts with struct user_za_header, containing:
 
 * Writes to NT_ARM_ZT will set PSTATE.ZA to 1.
 
+* If any register data is provided along with SME_PT_VL_ONEXEC then the
+  registers data will be interpreted with the current vector length, not
+  the vector length configured for use on exec.
+
 
 8.  ELF coredump extensions
 ---------------------------
diff --git a/Documentation/arch/arm64/sve.rst b/Documentation/arch/arm64/sve.rst
index 8d8837fc39ec71414a72dfef9e834f0800106fdd..28152492c29cbc7a81165a367e87d4aa327690f4 100644
--- a/Documentation/arch/arm64/sve.rst
+++ b/Documentation/arch/arm64/sve.rst
@@ -402,6 +402,10 @@ The regset data starts with struct user_sve_header, containing:
   streaming mode and any SETREGSET of NT_ARM_SSVE will enter streaming mode
   if the target was not in streaming mode.
 
+* If any register data is provided along with SVE_PT_VL_ONEXEC then the
+  registers data will be interpreted with the current vector length, not
+  the vector length configured for use on exec.
+
 * The effect of writing a partial, incomplete payload is unspecified.
 
 
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index b756578aeaeea1d3250276734520e3eaae8a671d..f09ffd70c9166aeb306376a34316499010376044 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -898,7 +898,11 @@ static int sve_set_common(struct task_struct *target,
 	if (ret)
 		goto out;
 
-	/* Actual VL set may be less than the user asked for: */
+	/*
+	 * Actual VL set may be different from what the user asked
+	 * for, or we may have configured the _ONEXEC VL not the
+	 * current VL:
+	 */
 	vq = sve_vq_from_vl(task_get_vl(target, type));
 
 	/* Enter/exit streaming mode */
@@ -1125,7 +1129,11 @@ static int za_set(struct task_struct *target,
 	if (ret)
 		goto out;
 
-	/* Actual VL set may be less than the user asked for: */
+	/*
+	 * Actual VL set may be different from what the user asked
+	 * for, or we may have configured the _ONEXEC rather than
+	 * current VL:
+	 */
 	vq = sve_vq_from_vl(task_get_sme_vl(target));
 
 	/* Ensure there is some SVE storage for streaming mode */

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241101-arm64-sve-ptrace-vl-set-db53eadbfc91

Best regards,
-- 
Mark Brown <broonie@kernel.org>


