Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8295CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kpVSr9gHlQi0GopQP3kB8p9/+gPvh4wfr7Vzvl6zPoM=; b=AkMLJlktCoWWslwRasJa19/lhM
	Qoqn3WVyyQ6F9NRqyZVlIELjdoCf5ltdmWzvGOIHW+0fWXlXzASuuYE68/9BHj1kwR5kaUbfWlAEQ
	+6I9QNz1fI3U3JTGIRuWINVE8unpoCo4Exd7IOGfYY0jaNmASr1mgVmwL7z+MHDCnb2zA/YQEuXNV
	anL9wTYsPmG3FiHZAV+MfWNqz1IgtqO90Q82A493JkdNPzyOYpplrHm/UhHCuUxA+KuAwEQXqGE7L
	RKNGKRq/5IHJLXxg4EgkhVdLwD0lVMqWGuKIvyVXKl3xonTxLecz+NKRKLWVsev1fli0gXetu47AG
	NUUU+Dlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9v1-00000006Jx8-0Xc6;
	Fri, 09 Oct 2026 12:41:47 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9ux-00000006Jvz-19qh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 12:41:45 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B2B3514000F8
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 08:41:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 09 Oct 2026 08:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1791549699; x=1791636099; bh=kpVSr9gHlQi0GopQP3kB8
	p9/+gPvh4wfr7Vzvl6zPoM=; b=JdWyUYvwHFb42I9cfl2d9QowaFLwR8ej6oX7+
	hrcLuVU4Vpq090HIqnJaQhZ5Xg3Qyio0A38dUZMYCGlvrMRLfD42xstLBdwomRCe
	T53alrp+sgqCv2vxNb6PdGEIAymIRmio21VHDM+yXDaPTQk1u5D/yI53wkb1VxS8
	rvIQ+Fq5cWabZLSJwiU4W1JmDGZwmV5/PXnxhv1/MEqC49yqyR+AXAtT2o8fIhhi
	3Ywrb6QAlQcmco+YPQXH11ymRB0dYsjYsusEn1wiGoD56ehssROBAk3g15yfX+Xx
	1QQjJcqiD9y0aC8vav5NvufwxSl7IS2XBV1kV9nRoc/ZciIrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791549699; x=1791636099; bh=kpVSr9gHlQi0GopQP3kB8p9/+gPvh4wfr7V
	zvl6zPoM=; b=RhyEEt2Ul+VRfX/Jw1SC3uniCJQb7SzsaIc2qrFVshjiLXVK87S
	+kC7Q6SJ+RpzJ2j/5Vc/6/e//dVLZmWNAe/ziLZn0b3vj1awd+FX/Y0lWrWmbdaz
	HAQkW/ZsVyJQAk5ITFovQzD2QkveMu7a2juqreoQd+xtoeW1C8opyfIr3iHz/auU
	quOcaq2Lm9Ml44cIwreXCmClZyPHU8nE6SWGyXHJdiq7v6Rbf4lYNMdHkXIdrNW/
	GsHFhXyy25FoPkyjwxn/6Sw5GSmOKZrAMi8DGTLa8AcF2783XkqQRD4Iz01YI4T1
	Nl6bKJzkDhgUhBY21nIXwp3abP/W8WeTR2w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791549699; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm3:rsa-sha256:f4QtVVFdekY5gducebRsWINH8mgUv5qRttvR1XGTZQaIsaM
	aHpVl1k3FASzdEaTkAUwPtt9uXGrEZCnjZ12BXbBcKGMh3EU2m+Ss5Afzz9yhH90
	SIr73RSZoE8c8/ssr3RwKPL2QoVaDOCJgTGQSLTqJPz548UipMaMXfa5/qdPo2Z/
	V1VHmRXroIQjHq5HkirSIQNs9VzxegLwJu1JRDeqGb/9btv7dhKBJ4wPRP1AtDFZ
	nETpjGrgfqFVDzLptSj76COhFVbSXbN3J/PcLh/KuGW81P6rJjrggBnu16VJmrsY
	8M4pRTUF36Lbib2YSEQzdteS0tJB0+HO5JvZGiw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:WZc1wECgbzrGt/wLnVTxc8T9coIzO2SfGqRrjpr8lkY=:cXQ2uYAXnsF0HDpHNFrfOB3H/gD/xL/ZzjSSAwTMiTA=;
X-ME-Sender: <xms:AuHIaj2_g7AekfpslRQcSf4hb9sCa3MRzlQFCeDx8EPV82TRrXhs8w>
    <xme:AuHIaqDxG7w-8VvdR9hVYMKXhoVo9b6U_hTTuGEzcWkHdPvNBrHQJPhPdvn5gP9S8
    KoQnuBYzFnXPZZhualdFn49yj8BH660ZInnTOfBQG-Vx7AXO1tVxmjh>
X-ME-Received: <xmr:AuHIarGqIcjPICvlPXRh99S6U0Zwm_N3dWGkKetTaveJ3U2hKlyVM1dnV3tPkLUF8JMnTUaq9GXo214Fw6Y>
X-ME-Proxy-Cause: dmFkZTF6x2cjlzKKOSSvIWXSsvMOZAaN/idE1zYMJYrdOvj3LXGcW/lyX3XLLCMERjEK9d
    JnVXPixAAlK83HvcO/8QX5QDKa6KmGj8WzDr91w234Mtl98JxuG6xawl4GJ+xAB6ItpKV6
    tGuWY0euMN+6pWAlcH34MBKSYSjvYJkR5uSOyZ7OZb36+wqVLzzqU1r3zGz2ljssBbTGJQ
    e8oqGVC6IOAlDshwVp58mY/bBfofdv4EIP55bhieA2SpDMyWL09S/xkKCPhea8FDf//5Dp
    qs34sWTMOwMkJEQdyJ+eOunVC45c2QYeBGbedQM3yWIeAUVf3atT5RiMMXTrwG6NKDMztm
    qEinbhnvanR6yQpPubg9X6g9TKNWtqiaqchumrCfxrzN/lqaJbH0QJmUBIWzrdCewCrQw5
    uJ8UWeEVSrUlwlpcPmCTQcQCjxcW7XJJoWu8WBHWjmyT8wgPoiVp6+OORFVvawRGFjWy/S
    zlZn2GRrGRXJYoL7JEtXUSa8gLglCnjC8kBzSfUTHSgl7SBjW6dc+FQ02XUPX0UGpVR677
    VctBVuC9Vy8L5XwyumeGJdxFZYrg5VOpa6eTa+RPt6kyLiDuXoJybO8J366jY648+TcjFP
    NKTyuKsGgq3pvlIrtYV4FbyNzYUkobyDk9u8+11TBm1yfFS3oSAOqx6y2sDQ
X-ME-Proxy: <xmx:AuHIavQQwGORNEiKrcjec9aKMv7lxcTz_FXw5ZrSLfQpD9oFD77V0g>
    <xmx:AuHIaiPC4fI3zZQdxNd43YrHr-b-_tdJ4Nhs_xdUYz6ET_MiISqyEg>
    <xmx:AuHIagNThbUaFyVIdNcfRPcZEoyzfTyoSAtoMufyjVsm1FTAuICwJA>
    <xmx:AuHIasH-e03IUaELJrTfj-9CONJxXK5PRc_0GF4DCfT6jXvNgMTbnw>
    <xmx:A-HIav6Ni-WOoex-aSvNFPa2TTAKBcrYMl83yz5eloBys05Ccr6O2l_f>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 08:41:34 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: linux@armlinux.org.uk,
	ojeda@kernel.org
Cc: ardb@kernel.org,
	chrisi.schrefl@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] ARM: rust: Generate unwind tables for Rust code with ARM_UNWIND
Date: Fri,  9 Oct 2026 21:41:24 +0900
Message-ID: <20261009124124.1176706-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_054143_589218_129206C3 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

When CONFIG_ARM_UNWIND=y, C code is built with -funwind-tables, but
Rust code is built with -Cforce-unwind-tables=n. As a result, the
unwinder stops at the first Rust frame.

Pass -Cforce-unwind-tables=y to rustc in that case, as arm64 does.

Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
Assisted-by: LLM
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/arm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 573813ef5e77..d59b8daf4f4e 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -117,6 +117,7 @@ endif
 
 ifeq ($(CONFIG_ARM_UNWIND),y)
 CFLAGS_ABI	+=-funwind-tables
+KBUILD_RUSTFLAGS += -Cforce-unwind-tables=y
 endif
 
 ifeq ($(CONFIG_CC_IS_CLANG),y)

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.43.0


