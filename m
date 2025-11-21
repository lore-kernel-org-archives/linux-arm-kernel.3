Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8EBCFA468
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:Message-Id:Content-Type
	:Mime-Version:Subject:Cc:To:Date:Content-Transfer-Encoding:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eJ+FzEufrvbHpOroaZ2V6g/NkWBVb9p6/GlSGX5who4=; b=yqXTXLA4RuF9MkAFVhviPVMZX+
	7hLsjwN4N8qcBif4ZxBlmz1c2M4KsjtRygl/a8FHOm/t8nCESuEty9NnJJTc/UXHC1bF2JCz/SOC3
	rL1dn14ZQTFVuYjiuZfdVrrEpfE46EMK0RkgdAwHTFwWLhtW+o8uQEOsHYb/f0BXjz0hShVYWioPZ
	toYxpX5wrge1ix82Gs3kn8nyaMtfQoYQSdsnd6kQ87nwThEvL7cPSTXO232BNFr0huK2f69UotTEO
	zqSKnqY5/Pgl6nJPU2Lm6TvlC1b4fAqfEDw3YhVMMQpmLWUesOWrA4HsuHw00vUhsXOWhVMTqFcEH
	/pE+0H1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMTh-0000000847D-3fZJ;
	Fri, 21 Nov 2025 08:26:49 +0000
Received: from sg-1-103.ptr.blmpb.com ([118.26.132.103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMTQ-0000000841B-1B02
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 08:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1763713582; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=eJ+FzEufrvbHpOroaZ2V6g/NkWBVb9p6/GlSGX5who4=;
 b=PeFSzCGDA+NKze4ebHCvIJHhw8qQHa2mc06mQ7cdW04q4P+KxdIvvISbmrEIPZ1g+w8xfA
 x3Kaw1fSFIWxqDUbL+Ref8TqbRrX4iA0iQVry79wTy+GRKcTshyIZWPXf6/gS1+/rGfPkR
 PufKNJi71vkb94vjl/fTUwO7OVogzzY6KP7cPvLNWBFFc6iIYcRGq2O62rvAiG2yHa6oNn
 I+iw99BLWWJZzfmV5HcsD9XWiQAE9MVgefqLYEpVbfgyzpGJLr0ribE0Jxsz/Zn2p1c5HH
 JuTYRmK6VEi/fUPQdYMdqJzrAOPta/Ayq9EpJ6oOoox+t0n1PetoLY2FcpgGnw==
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Nov 2025 16:26:19 +0800
To: <cleger@rivosinc.com>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"Himanshu Chauhan" <hchauhan@ventanamicro.com>, 
	"Anup Patel" <apatel@ventanamicro.com>, 
	=?utf-8?q?=E8=B7=AF=E6=97=AD?= <luxu.kernel@bytedance.com>, 
	"Atish Patra" <atishp@atishpatra.org>, 
	=?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
	=?utf-8?q?=E5=B4=94=E8=BF=90=E8=BE=89?= <cuiyunhui@bytedance.com>, 
	=?utf-8?q?=E5=85=83=E7=AB=B9?= <yuanzhu@bytedance.com>
Subject: SSE May Corrupt KVM's Context
Mime-Version: 1.0
X-Lms-Return-Path: <lba+16920222c+946b48+lists.infradead.org+zhangzhanpeng.jasper@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Message-Id: <00786ddb6d626442879072851d455bbd8ef1181d.e1f179e9.b8a1.463b.998f.98948268e9ea@bytedance.com>
From: "Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_002632_664040_5F57FFD4 
X-CRM114-Status: UNSURE (   5.23  )
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

Hi Cl=C3=A9ment,=C2=A0

I encountered another SSE problem recently. Host SSE events may affect the =
guest. Neither PMU-SBI-SSE or KVM-SSE is enabled. Just using the simplest r=
iscv_sse_test to trigger ecall SSE, and it will affect the KVM vcpu running=
 in the background.

The following log is the output of KVM and QEMU when vcpu crashes:

[=C2=A0 152.228548] kvm [145]: VCPU exit error -14
[=C2=A0 152.230664] kvm [145]: SEPC=3D0xffffffff80040280 SSTATUS=3D0x200004=
500 HSTATUS=3D0x200201100
[=C2=A0 152.231868] kvm [145]: SCAUSE=3D0xf STVAL=3D0x3c8 HTVAL=3D0x0 HTINS=
T=3D0x103023
error: kvm run failed Bad address
=C2=A0pc =C2=A0 =C2=A0 =C2=A0 ffffffff80040280
=C2=A0mhartid=C2=A0 0000000000000000
=C2=A0mstatus=C2=A0 0000000200000100
=C2=A0mip =C2=A0 =C2=A0=C2=A0 0000000000000000
=C2=A0mie =C2=A0 =C2=A0=C2=A0 0000000000000000
=C2=A0mideleg=C2=A0 0000000000000000
=C2=A0medeleg=C2=A0 0000000000000000
=C2=A0mtvec =C2=A0=C2=A0 0000000000000000
=C2=A0mepc =C2=A0 =C2=A0 0000000000000000
=C2=A0mcause =C2=A0 0000000000000000
=C2=A0mtval =C2=A0=C2=A0 0000000000000000
=C2=A0mscratch 0000000000000000
=C2=A0x0/zero=C2=A0 0000000000000000 x1/ra =C2=A0=C2=A0 ffffffff80c1ac2c x2=
/sp =C2=A0=C2=A0 ffffffff81e03cf0 x3/gp =C2=A0=C2=A0 ffffffff8201aa68
=C2=A0x4/tp =C2=A0=C2=A0 ffffffff81e0e0c0 x5/t0 =C2=A0=C2=A0 ffffffff80b91a=
08 x6/t1 =C2=A0=C2=A0 ffffaf80fee00000 x7/t2 =C2=A0=C2=A0 0000000200000020
=C2=A0x8/s0 =C2=A0=C2=A0 ffffffff81e03d50 x9/s1 =C2=A0=C2=A0 00000000010000=
00 x10/a0 =C2=A0 0000000000000000 x11/a1 =C2=A0 0000000000000000
=C2=A0x12/a2 =C2=A0 0000000001000000 x13/a3 =C2=A0 ffffaf80ffe00000 x14/a4 =
=C2=A0 0000000000000000 x15/a5 =C2=A0 ffffaf7f80000000
=C2=A0x16/a6 =C2=A0 0000000000000002 x17/a7 =C2=A0 0000000000000002 x18/s2 =
=C2=A0 ffffaf80fee00000 x19/s3 =C2=A0 ffffffff81639170
=C2=A0x20/s4 =C2=A0 ffffffff820200f8 x21/s5 =C2=A0 0000000000000000 x22/s6 =
=C2=A0 0000000000000000 x23/s7 =C2=A0 0000000000000000
=C2=A0x24/s8 =C2=A0 0000000000000000 x25/s9 =C2=A0 0000000000000000 x26/s10=
=C2=A0 0000000000000000 x27/s11=C2=A0 0000000000000000
=C2=A0x28/t3 =C2=A0 ffffffff80b85110 x29/t4 =C2=A0 ffffffff8205d258 x30/t5 =
=C2=A0 ffffffff8205d258 x31/t6 =C2=A0 ffffffff8205d2a0
[=C2=A0 152.312824] riscv_sse_test: FAILED: Failed to wait for event local_=
software_injected completion on CPU 2
[=C2=A0 152.317933] riscv_sse_test: FAILED: Received SSE event -65536 on CP=
U 2 instead of 4

The following is the assembly context where vcpu crashes, which is the SAVE=
_GUEST_GPRS macro that runs when it get back to host(vcpu_switch.S: Lkvm_sw=
itch_return).
The sscratch is set to 0(or other bad and low addresses) by mistake, causin=
g a crash when storing the virtual machine context.

=C2=A0=C2=A0 0xffffffff8004027c <+252>: =C2=A0 csrrw =C2=A0 a0,sscratch,a0
=C2=A0=C2=A0 0xffffffff80040280 <+256>: =C2=A0 sd =C2=A0 =C2=A0=C2=A0 ra,96=
8(a0)
=C2=A0=C2=A0 0xffffffff80040284 <+260>: =C2=A0 sd =C2=A0 =C2=A0=C2=A0 sp,97=
6(a0)
=C2=A0=C2=A0 0xffffffff80040288 <+264>: =C2=A0 sd =C2=A0 =C2=A0=C2=A0 gp,98=
4(a0)
=C2=A0=C2=A0 0xffffffff8004028c <+268>: =C2=A0 sd =C2=A0 =C2=A0=C2=A0 tp,99=
2(a0)
=C2=A0=C2=A0 0xffffffff80040290 <+272>: =C2=A0 sd =C2=A0 =C2=A0=C2=A0 t0,10=
00(a0)
=C2=A0=C2=A0 0xffffffff80040294 <+276>: =C2=A0 sd =C2=A0 =C2=A0=C2=A0 t1,10=
08(a0)

This is a must-occur problem in my environment. As long as an idle VM is ru=
nning in the background,=C2=A0 run the SSE test in loop on the host, and th=
e vcpu will crash. Can this problem be reproduced in your environment?

Regards,
Zhanpeng

