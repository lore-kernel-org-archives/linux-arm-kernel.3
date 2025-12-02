Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF2CCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8ErvIq4wO654pjC8lFFnpoWMuH5/G/OdedGnE70Z3ZM=; b=Xt0IEor6fRfpuDIsAbPzC1JmMA
	uu9iBxNcYevAIqIkor9TP90oPHTV36FXZKw3xE9INSNnE5Ev+uPP9GOjNVj6CeozoFtPWgu5iWi0a
	wvExN190NeHMCX7yOi0HP1hxpGq+F75MsQ/RR9Onv8hpVpCcrFuJHc2o/Ro3Tpt5HZe7XdEi6nkUN
	QJ3pJTfiVMtKQQ93czNopxUaYwJ0/S8j+k4V1jqBpAXTMu7UMseFYv2Z+RqGKTK1KZ6H7Ood6/vqS
	EaSlB9Zjm4UBB9JiH+ksGUSFh/ZeeQ4Dsxm1TT8j7RcOe0M48Xw3Ap0v6t7StyTPxXudmiGwcFkyv
	khpEjQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQO0o-00000005Hmc-02QR;
	Tue, 02 Dec 2025 10:53:38 +0000
Received: from mail-106103.protonmail.ch ([79.135.106.103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQO0l-00000005Hm9-0PIv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1764672809; x=1764932009;
	bh=8ErvIq4wO654pjC8lFFnpoWMuH5/G/OdedGnE70Z3ZM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aWGUwCrrAMEEO49N3Fohx09bRwcMMoZkbnOwzBO6R4bHzQjyI9n38oZBcqM+SS72e
	 b2/L3OfnzBq3gZS52RB2h1vQUCHmWmldpj1/Ib9qLSBc5PUZfhMKJfURWq8n7gEmB7
	 hTGLZx0KdnrlKDALzBNBoSTQPGNG/Hju3cf/rilsJ0zplPCvri7xl7V1MnHBEwQjin
	 GCf/NyCbShasFdNDPjaMOSNwoLggAT7NrnTHafr8PvkPMWN/uuJDLW+CE+3OpVdlBD
	 6nPRCeN4KERrHt0F9twgjn7/tnQS8rYWtuqWnlDBlvxHl05aFO1xBtjmOhGuZzG/Bg
	 MHN6JTbsskf2Q==
Date: Tue, 02 Dec 2025 10:53:24 +0000
To: Marc Zyngier <maz@kernel.org>
From: zhuling0805 <zhuling0805@proton.me>
Cc: Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] irqchip/gic: Fix UBSAN shift-out-of-bounds in GIC helpers
Message-ID: <2fJDwUUYdEf2_eaRa041L9xkT8RkSWFeo7euOnqMbbPhUatLlEaAvGfB6sOspDmXaxO87Eh7bQLV9UolyjbMtZBT1wB2UGypjPOo0Z-RC0Q=@proton.me>
Feedback-ID: 122560893:user:proton
X-Pm-Message-ID: 695aad0473b3017deaba2da62c1de2314785bcb5
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_sgd5sRmCa2K7OT2Go3oILQwoamVTwFJzQMq411Tsw"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_025335_771845_13079D18 
X-CRM114-Status: GOOD (  13.40  )
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

--b1=_sgd5sRmCa2K7OT2Go3oILQwoamVTwFJzQMq411Tsw
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

When running a kernel built with UBSAN enabled, enabling a GPIO
controller that uses a GIC interrupt as its parent triggers several
shift-out-of-bounds warnings in the GIC helpers.

This patch fixes the issue by using unsigned constants so that the
left shifts are well-defined and UBSAN stays quiet.

Thanks,
Zhu Ling

---
From: Zhu Ling <zhuling0805@proton.me>
Date: Tue, 2 Dec 2025 17:54:10 +0800
Subject: [PATCH] irqchip/gic: Fix UBSAN shift-out-of-bounds in GIC helpers

When running with UBSAN enabled, enabling a GPIO controller that uses
a GIC interrupt as its parent triggers several shift-out-of-bounds
warnings:

  UBSAN: shift-out-of-bounds in drivers/irqchip/irq-gic-common.c:50:21
  left shift of 2 by 30 places cannot be represented in type 'int'

and similar reports in gic_poke_irq() and gic_peek_irq() in
drivers/irqchip/irq-gic-v3.c.

These come from shifting signed integer constants. Use unsigned
constants (0x2U and 1U) so that the behavior is well-defined and the
UBSAN warnings go away.

Signed-off-by: Zhu Ling <zhuling0805@proton.me>
---
 drivers/irqchip/irq-gic-common.c | 2 +-
 drivers/irqchip/irq-gic-v3.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-com=
mon.c
index c776f9142..d4f0afd9e 100644
--- a/drivers/irqchip/irq-gic-common.c
+++ b/drivers/irqchip/irq-gic-common.c
@@ -48,7 +48,7 @@ void gic_enable_quirks(u32 iidr, const struct gic_quirk *=
quirks,
 int gic_configure_irq(unsigned int irq, unsigned int type,
 =09=09       void __iomem *base)
 {
-=09u32 confmask =3D 0x2 << ((irq % 16) * 2);
+=09u32 confmask =3D 0x2U << ((irq % 16) * 2);
 =09u32 confoff =3D (irq / 16) * 4;
 =09u32 val, oldval;
 =09int ret =3D 0;
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 3de351e66..f5226c03f 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -457,7 +457,7 @@ static int gic_peek_irq(struct irq_data *d, u32 offset)
 =09u32 index, mask;
=20
 =09offset =3D convert_offset_index(d, offset, &index);
-=09mask =3D 1 << (index % 32);
+=09mask =3D 1U << (index % 32);
=20
 =09if (gic_irq_in_rdist(d))
 =09=09base =3D gic_data_rdist_sgi_base();
@@ -473,7 +473,7 @@ static void gic_poke_irq(struct irq_data *d, u32 offset=
)
 =09u32 index, mask;
=20
 =09offset =3D convert_offset_index(d, offset, &index);
-=09mask =3D 1 << (index % 32);
+=09mask =3D 1U << (index % 32);
=20
 =09if (gic_irq_in_rdist(d))
 =09=09base =3D gic_data_rdist_sgi_base();
--=20
2.17.1
--b1=_sgd5sRmCa2K7OT2Go3oILQwoamVTwFJzQMq411Tsw
Content-Type: application/octet-stream; name=0001-irqchip-gic-Fix-UBSAN-shift-out-of-bounds-in-GIC-hel.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0001-irqchip-gic-Fix-UBSAN-shift-out-of-bounds-in-GIC-hel.patch

RnJvbSA2YjQ2ZTRjZTQwZGRkM2YxOGE3M2Q5YzY2YmViZjIyYTE2N2JkNWYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBaaHUgTGluZyA8emh1bGluZzA4MDVAcHJvdG9uLm1lPgpEYXRl
OiBUdWUsIDIgRGVjIDIwMjUgMTc6NTQ6MTAgKzA4MDAKU3ViamVjdDogW1BBVENIXSBpcnFjaGlw
L2dpYzogRml4IFVCU0FOIHNoaWZ0LW91dC1vZi1ib3VuZHMgaW4gR0lDIGhlbHBlcnMKCldoZW4g
cnVubmluZyB3aXRoIFVCU0FOIGVuYWJsZWQsIGVuYWJsaW5nIGEgR1BJTyBjb250cm9sbGVyIHRo
YXQgdXNlcwphIEdJQyBpbnRlcnJ1cHQgYXMgaXRzIHBhcmVudCB0cmlnZ2VycyBzZXZlcmFsIHNo
aWZ0LW91dC1vZi1ib3VuZHMKd2FybmluZ3M6CgogIFVCU0FOOiBzaGlmdC1vdXQtb2YtYm91bmRz
IGluIGRyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLWNvbW1vbi5jOjUwOjIxCiAgbGVmdCBzaGlmdCBv
ZiAyIGJ5IDMwIHBsYWNlcyBjYW5ub3QgYmUgcmVwcmVzZW50ZWQgaW4gdHlwZSAnaW50JwoKYW5k
IHNpbWlsYXIgcmVwb3J0cyBpbiBnaWNfcG9rZV9pcnEoKSBhbmQgZ2ljX3BlZWtfaXJxKCkgaW4K
ZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMuYy4KClRoZXNlIGNvbWUgZnJvbSBzaGlmdGluZyBz
aWduZWQgaW50ZWdlciBjb25zdGFudHMuIFVzZSB1bnNpZ25lZApjb25zdGFudHMgKDB4MlUgYW5k
IDFVKSBzbyB0aGF0IHRoZSBiZWhhdmlvciBpcyB3ZWxsLWRlZmluZWQgYW5kIHRoZQpVQlNBTiB3
YXJuaW5ncyBnbyBhd2F5LgoKU2lnbmVkLW9mZi1ieTogWmh1IExpbmcgPHpodWxpbmcwODA1QHBy
b3Rvbi5tZT4KLS0tCiBkcml2ZXJzL2lycWNoaXAvaXJxLWdpYy1jb21tb24uYyB8IDIgKy0KIGRy
aXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYzLmMgICAgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2ly
cWNoaXAvaXJxLWdpYy1jb21tb24uYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLWNvbW1vbi5j
CmluZGV4IGM3NzZmOTE0Mi4uZDRmMGFmZDllIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lycWNoaXAv
aXJxLWdpYy1jb21tb24uYworKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy1jb21tb24uYwpA
QCAtNDgsNyArNDgsNyBAQCB2b2lkIGdpY19lbmFibGVfcXVpcmtzKHUzMiBpaWRyLCBjb25zdCBz
dHJ1Y3QgZ2ljX3F1aXJrICpxdWlya3MsCiBpbnQgZ2ljX2NvbmZpZ3VyZV9pcnEodW5zaWduZWQg
aW50IGlycSwgdW5zaWduZWQgaW50IHR5cGUsCiAJCSAgICAgICB2b2lkIF9faW9tZW0gKmJhc2Up
CiB7Ci0JdTMyIGNvbmZtYXNrID0gMHgyIDw8ICgoaXJxICUgMTYpICogMik7CisJdTMyIGNvbmZt
YXNrID0gMHgyVSA8PCAoKGlycSAlIDE2KSAqIDIpOwogCXUzMiBjb25mb2ZmID0gKGlycSAvIDE2
KSAqIDQ7CiAJdTMyIHZhbCwgb2xkdmFsOwogCWludCByZXQgPSAwOwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pcnFjaGlwL2lycS1naWMtdjMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYzLmMK
aW5kZXggM2RlMzUxZTY2Li5mNTIyNmMwM2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaXJxY2hpcC9p
cnEtZ2ljLXYzLmMKKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMuYwpAQCAtNDU3LDcg
KzQ1Nyw3IEBAIHN0YXRpYyBpbnQgZ2ljX3BlZWtfaXJxKHN0cnVjdCBpcnFfZGF0YSAqZCwgdTMy
IG9mZnNldCkKIAl1MzIgaW5kZXgsIG1hc2s7CiAKIAlvZmZzZXQgPSBjb252ZXJ0X29mZnNldF9p
bmRleChkLCBvZmZzZXQsICZpbmRleCk7Ci0JbWFzayA9IDEgPDwgKGluZGV4ICUgMzIpOworCW1h
c2sgPSAxVSA8PCAoaW5kZXggJSAzMik7CiAKIAlpZiAoZ2ljX2lycV9pbl9yZGlzdChkKSkKIAkJ
YmFzZSA9IGdpY19kYXRhX3JkaXN0X3NnaV9iYXNlKCk7CkBAIC00NzMsNyArNDczLDcgQEAgc3Rh
dGljIHZvaWQgZ2ljX3Bva2VfaXJxKHN0cnVjdCBpcnFfZGF0YSAqZCwgdTMyIG9mZnNldCkKIAl1
MzIgaW5kZXgsIG1hc2s7CiAKIAlvZmZzZXQgPSBjb252ZXJ0X29mZnNldF9pbmRleChkLCBvZmZz
ZXQsICZpbmRleCk7Ci0JbWFzayA9IDEgPDwgKGluZGV4ICUgMzIpOworCW1hc2sgPSAxVSA8PCAo
aW5kZXggJSAzMik7CiAKIAlpZiAoZ2ljX2lycV9pbl9yZGlzdChkKSkKIAkJYmFzZSA9IGdpY19k
YXRhX3JkaXN0X3NnaV9iYXNlKCk7Ci0tIAoyLjE3LjEKCg==

--b1=_sgd5sRmCa2K7OT2Go3oILQwoamVTwFJzQMq411Tsw--


