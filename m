Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C62C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 19:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlKFAiXF1vqmNku37ywbRPDu9DnnoONEYBqGIA8J8Tc=; b=ocWUVGuiknaTX6
	dV9RSC+2+8QOvsD7dKl2SY2Czr/LKUjkCk5ulwuol1vpoJXADzU/WpjTZU7HTqxoWxWAHWeon7V1h
	McBnNeVlDaQwk0SIznu1AXJy6EmF2w40tWbkjpaM0R9wsP2mEQySZDETrdQZFwa+9zB2ERnkGt5wE
	OyFiYS+b1QdIHgXYYVBCHvnkStPY8Q4TGHe/Xj8naKs7cdsxSIii9l+Y0OG/fDCDpWk+VnXbxhsj8
	5ye//e53+CaAuWej/IHMRTUZYBcZIAodY1yhF8NX1ZWUMR7Q2JcRQqQPcfwbqoYD1ursNvVgAw1oa
	6iNn1erRW4pARSKHjdKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjNUL-00000000cLY-051q;
	Sat, 15 Feb 2025 19:06:05 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjNSs-00000000c50-2L11
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 19:04:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso34621015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 11:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739646273; x=1740251073; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KlKFAiXF1vqmNku37ywbRPDu9DnnoONEYBqGIA8J8Tc=;
        b=U/qJujYNlVOlJUbN7FWekVs2XPg0vhQSvwYQO5ubWuy0IPjNARogc8VyDXydXZl3hx
         +U0DSYJaR0/wFItIkOTcKjtqa1caP+UGrl/GhZOTYqftBdikKvtVujl5n91couNaAk+W
         0MdkAQCkVNU0uqW9ser6yujCtsaJaDw/wXpP3p/oG2VOHFrqDRuxulC3+E3ZpGcHtFq0
         m1d+z4hpyye6i/UcU7bDHGZJt4dfOm738qRWxi6O89nlJzZiF6xjBIKo5qU6p9HAOsJE
         hZ9mR8vy9XBWaHYDXX2ir99zO+J38MFLaMdMkIk1FLbtQ5z889LH73oifnx92jZ3fblc
         Z7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739646273; x=1740251073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KlKFAiXF1vqmNku37ywbRPDu9DnnoONEYBqGIA8J8Tc=;
        b=lCS7BuOv5tUj8YiadWFuLBvRyUkEK4TPIBXHTUB4l8ed9HXgPo/KQVPr8ixgVrVd/+
         4QPSk+akxH0XPbsKEQsa6Rk2YHnF8GQs4+CtHcBwq8LXGa4J+OcsrBk9ZZwBUgfhhotk
         w1o86D+vayx4e50CiaRKbbvEMpcccUXA7fejZ48vq0kty3M/+n0/simwzctOmHqKU574
         LjOOm4H1tb5mcI7TfgBaNPSKFQpMDYzQRugHq+vOBN4KI0r+1erourm3sJsjAzFizNeC
         Nv0b2F2fY5xeA7TGWWd8QUbJpk3/Gp9lbU47/tdFVsSjNebDRvdrJXt6JuEFelbQfOPA
         dsMw==
X-Forwarded-Encrypted: i=1; AJvYcCWOwvMNh2n8YKdO6LQOSA0Rx5qpRHwGcS8cissfMqnMiuXpuW7wUmO1jJJudt8atvUhQgRpRwmYBbechTtUeeEZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwUNU+EHYXeU6zpXL+CtQFJPRNsOZCVmg0RDGlraAlfEk77o3PD
	hIYz4YgYunWrOqy1S/tGbiCclkHqqC8bCC/pXWEkWT2bIt0rOFU+Ne7Cw5aIM6T0KDT8YktN90C
	EV2Py0MoA21Vt9zIZeZpJfLElysQ=
X-Gm-Gg: ASbGncuZgp8696ZX3d4NeDMus39veZAoJtp/w8Qr3rZHD6FQLQlaTiL+n+C5BRn9czH
	FIPaJ7Yq5ST2RyrwuIFHbIvCvPGPmoJmKnSmlWlzylLD9O4Rsp+kX3wi3W40u2IzpskWE8V6I
X-Google-Smtp-Source: AGHT+IEocBWSCkH48AST7THBakDBtI1P2cdLUqJH6P86HXBwtD0EzH2fLPQKQwSVk/LyuSbjXvQi9m7uLUhUvVcdzzs=
X-Received: by 2002:adf:f6c6:0:b0:38d:d371:e01d with SMTP id
 ffacd0b85a97d-38f33f565c1mr3601951f8f.49.1739646272570; Sat, 15 Feb 2025
 11:04:32 -0800 (PST)
MIME-Version: 1.0
References: <20250211143910.16775-1-sebott@redhat.com> <20250211143910.16775-2-sebott@redhat.com>
 <Z7BoydkyT_h0gwOV@linux.dev> <CAE2XoE_8ihJZQF856w-_F+cgJW7fLWGz7M7Ztoxzw2vE51_m1A@mail.gmail.com>
 <87v7tb17os.wl-maz@kernel.org>
In-Reply-To: <87v7tb17os.wl-maz@kernel.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sun, 16 Feb 2025 03:04:20 +0800
X-Gm-Features: AWEUYZmlz4_KXFrAI2Ba46wtyq_RK2-V1RipaueUyL2YXpkrSGw8aW2NemzLpwc
Message-ID: <CAE2XoE9=hjP+qpsy+FcYcSDectDajiXjtcMCVpacSo4cFOo=tQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] KVM: arm64: Allow userspace to change MIDR_EL1
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Sebastian Ott <sebott@redhat.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
	Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_110434_596104_AB189420 
X-CRM114-Status: GOOD (  18.41  )
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
Reply-To: luoyonggang@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

>
> How do you determine that MIDR isn't updated? How do you update the
> userspace view?
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

The testing code is at
https://github.com/lygstate/arm64-kvm-hello-world/tree/midr/bare-metal-aarc=
h32-qemu
qemu changes:
```
From 543f2f656952ab01509025b79d0198736ef68231 Mon Sep 17 00:00:00 2001
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sun, 16 Feb 2025 02:57:44 +0800
Subject: [PATCH] Add support midr options for arm virt machine

---
 hw/arm/virt.c         | 20 ++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 target/arm/kvm.c      | 21 +++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4a5a9666e9..5ba690a70d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2236,6 +2236,10 @@ static void machvirt_init(MachineState *machine)
         object_property_set_int(cpuobj, "mp-affinity",
                                 possible_cpus->cpus[n].arch_id, NULL);

+        if (vms->midr) {
+            object_property_set_int(cpuobj, "midr", vms->midr, NULL);
+        }
+
         cs =3D CPU(cpuobj);
         cs->cpu_index =3D n;

@@ -3348,6 +3352,17 @@ static const TypeInfo virt_machine_info =3D {
     },
 };

+static char * virt_get_midr(Object *obj, Error **errp)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(obj);
+    return g_strdup_printf("0x%08x", vms->midr);
+}
+static void virt_set_midr(Object *obj, const char *value, Error **errp)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(obj);
+    vms->midr =3D strtoul(value, 0, 0);
+}
+
 static void machvirt_machine_init(void)
 {
     type_register_static(&virt_machine_info);
@@ -3356,6 +3371,11 @@ type_init(machvirt_machine_init);

 static void virt_machine_10_0_options(MachineClass *mc)
 {
+    ObjectClass *oc =3D &mc->parent_class;
+    object_class_property_add_str(oc, "midr", virt_get_midr,
+        virt_set_midr);
+    object_class_property_set_description(oc, "midr",
+                "Set MDIR value for VIRT machine");
 }
 DEFINE_VIRT_MACHINE_AS_LATEST(10, 0)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c8e94e6aed..fe200b0d76 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -179,6 +179,7 @@ struct VirtMachineState {
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
+    uint32_t midr;
     bool ns_el2_virt_timer_irq;
 };

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index da30bdbb23..577eaee505 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1873,6 +1873,7 @@ static int kvm_arm_sve_set_vls(ARMCPU *cpu)
 }

 #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
+#define ARM_CPU_ID_MIDR_EL1    3, 0, 0, 0, 0

 int kvm_arch_init_vcpu(CPUState *cs)
 {
@@ -1920,6 +1921,26 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return ret;
     }

+    {
+        uint64_t midr =3D cpu->midr;
+        ret =3D kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MIDR_EL1), &m=
idr);
+        if (ret) {
+            return ret;
+        }
+        printf("Get MIDR EL1 origin:0x%08x\n", (uint32_t)midr);
+        midr =3D cpu->midr;
+        ret =3D kvm_set_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MIDR_EL1), &m=
idr);
+        printf("Set MIDR EL1:0x%08x\n", (uint32_t)midr);
+        if (ret) {
+            return ret;
+        }
+        ret =3D kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MIDR_EL1), &m=
idr);
+        printf("Get MIDR EL1:0x%08x\n", (uint32_t)midr);
+        if (ret) {
+            return ret;
+        }
+    }
+
     if (cpu_isar_feature(aa64_sve, cpu)) {
         ret =3D kvm_arm_sve_set_vls(cpu);
         if (ret) {
--=20
2.47.1.windows.1

```
The TCG running result:
```
/home/lygstate/work/qemu/build:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin
/home/lygstate/work/qemu/build/qemu-system-aarch64
+ qemu-system-aarch64 -cpu cortex-a15 -accel tcg,thread=3Dmulti -m 1024M
-smp 1 -M virt,gic-version=3D3,midr=3D0x412fd050 -nographic -monitor none
-serial stdio -kernel
/home/lygstate/work/debian/arm64-kvm-hello-world/bare-metal-aarch32-qemu/he=
llo_world.elf
Hello World midr:0x412fd050
```
The KVM running result:
```
/home/lygstate/work/qemu/build:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin
/home/lygstate/work/qemu/build/qemu-system-aarch64
+ qemu-system-aarch64 -cpu host,aarch64=3Doff -accel kvm -m 1024M -smp 1
-M virt,gic-version=3D3,midr=3D0x412fd050 -nographic -monitor none -serial
stdio -kernel /home/lygstate/work/debian/arm64-kvm-hello-world/bare-metal-a=
arch32-qemu/hello_world.elf
Get MIDR EL1 origin:0x410fd083
Set MIDR EL1:0x412fd050
Get MIDR EL1:0x412fd050
Hello World midr:0x410fd083
```

According to this, the MIDR EL1 is updated properly, but the MIDR for
aarch32 is not updated, and I don't know how to hook the update for
MIDR for aarch32
--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

