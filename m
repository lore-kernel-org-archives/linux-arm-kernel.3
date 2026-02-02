Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26031E7315A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 11:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pk0F2DbhjlgeMmEV6A/bG9XIycCE9QwvAWLvJWCiNfs=; b=GVI7cFpSDgbxrOwbPBM0fzcZvC
	JdHEgxRv1vhS3xTPkTjJ5AjmFGtxAuxA86JR9Xu5W8ui4cFE6K2sSrQAeTYJq5dzt7p/6Pla8EQYi
	GpPKwD+EEGQF+/8nmhrqDak0FC66SEy2AyILDyNnPiUcI/obokZBbb3/QZ/NR53tq5VuUVVnH/XuT
	bALUdwJirF0JxF5bVAhg7TzJ9lFO5hU0A//+0GrW/NYMIJrBOoXQCHR0SpP7MShw3WpZK1b2vYIIK
	O/j+WQvbvEC6Tq84vTEOgaJfxqZXYQ338etE2oqYMHzPSQ0MlzRlzVQ3xMqAIwAR8gP4tpu3CCDPP
	oMUcM+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsFn-00000004v0m-0DFb;
	Mon, 02 Feb 2026 11:38:03 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsFk-00000004v0L-0veG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 11:38:01 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-794d3bba0ccso8208697b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 03:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770032278; cv=none;
        d=google.com; s=arc-20240605;
        b=WjHsQsdNo0zjuEkyWwdT0pYfChah3qjzEsJYxjkkPISCFl7ThtYZZUU7O/HafcDlgy
         CzbMNoeA/kYA93qiOvZ4CLzcv/STi9ehWZMeU1ttnkEfFHYGLlj061BLWmWNlLVJg9sY
         EfrLmuNHquJy1L62QvzrMllEEngjr0UQ42Yio66Rs5Qvzz/NMx/+jCBkNzZYfm5fcWoB
         PwG0pPFZGYvIYlLomXWMITPGjj0eLANE0m4zHeZJX/x0dfXwB+7kP6YsCX/tsx8jci8q
         6CeR4+JSnSs84nmPPz97volLIMO+PFo0e+dLtFszRWNOCm6VVPUUzfE6GYggAQXDNS0M
         OqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=pk0F2DbhjlgeMmEV6A/bG9XIycCE9QwvAWLvJWCiNfs=;
        fh=8NrctBK90qXWlIoCflzzEoof9XbgAY8DOylFHK3oPXY=;
        b=HxkuFtKdkYSJ4YroTB0J1ZOLExpjm2+VqYHLapr7HpH5ZkgGiBFZQ+QZqYbKL6nuzh
         qf9DaNYKj6OyeakCXHu1xjnzr9ZITgEe7ZXrwWF/T97/arIGqwnudIzKlnil+Soyel+8
         CDbpBPg7Cd9UHhTul2eM5EHyfvNx2USOi+MwW3EKL0UB+i/hzI7irvRYXV4UaTjp0Elt
         CtPMfSuy1zaT/x6BQpOj7RrJx2xey8GpnReZXC/RhZv9v7vRKjJFkZDALerieJFUwYan
         SF6U/aGSwc9wjOdruJgHfxP2sffYh+O7TerIyggn6xitosYrHWQ6XFuh8bSejbEbaKLn
         b54w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770032278; x=1770637078; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pk0F2DbhjlgeMmEV6A/bG9XIycCE9QwvAWLvJWCiNfs=;
        b=qFO5Oz2CN0k1Aye0HFdu7PumR+InpC9iqdd7ctDcF8xjY66yQfgPjfpWUtrxfORM7X
         EhuNiWpVF24CE3eBmLkREkW4i0bkRhwFXU8+qCACRNB9ikU16DShwpvMwRJrCcabYmBa
         +3khF2sWyZeS3pLAgOHWgZmjMVarVBBqbaao49nsS79q/rZhEpeUal+v9imGaO5OIK1Y
         SKBO9pJ44geQjlbM4h6bWOvWwWMRZDtFXaoqBaXTldbqPZNtHYdbjVQkVSyhDQE+NVd6
         J9UDVKdRWwL5YZsWELSPVxiEusSxcOzbql+adYkpTI0+kJfbSVrrkZHQTb35gZOloBjM
         D1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770032278; x=1770637078;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pk0F2DbhjlgeMmEV6A/bG9XIycCE9QwvAWLvJWCiNfs=;
        b=WG0jPxpSqkpEHvCTsSuwVHrL7jGj+yRQFRtRS2AGY7TN0ZcQKPHXweTQnvQ7bY+tco
         dldHGHs5isQcccwuRlBW1mXz3xF6New972i6ltmc+26Fajz5Y0io8wxYXHbYPivWOSOg
         BUUZ+KdEakwyg+uqu6FFNiquEkHDGX7QjBpplRlKJzR2/jeKHTOS85ba+D6Vcd55Pf4J
         XnhALHR3el9wL/XvmaV0ILYunE36qc424Tar2R9PyqACclW09YDrEG3m1S8mM+NBcvLS
         30EM8v0TeRbLsPCDpVlxJhWQaOqY7m0a0SzTLbS1RkuUeRnmX+RP4YezQKqltCleH98I
         tQqw==
X-Gm-Message-State: AOJu0Yww2jG5fxj7AC7NcD/jtvJo+vSIlipthRBxH7EyNdRg0jgH9zQ5
	a3S/8q/4wC7MvqKYb5Dbo+eXM9H0ZUtReyagWJJZ4ey5paXvjNCKfGEEVQ6ZaOox3FKFwsn895P
	yIaSsD/6qiBHDyofIgQdpUBLzTVDNCsnE6U6POdLDComqBc4VtE/DcqQ=
X-Gm-Gg: AZuq6aJvSOiVWqv6ItYQPeA+KnhKdz1D2xUw4kke9FXpaLyIit27gHNg0XSiH5jMkx/
	hOPolH1pc2MXWv7188qMrAQ69I/3c80NRnPxUGt1P7Ev3zUKyqXAUG3GN/UwB9a4cwJWHGg9XYh
	vLYhWQbg2hSKbtDCte32vsw5+TRoC8kH8IBDXzrWWK36C4Rn1w7i+WIXHMeDh85bORFzK9XXkws
	kCMNWHdQFfllDdxvuX5+k6NsApnPGNMkwfoeKtYNj9+usjIlX9h3aN9KwWCft6EMD4scT7or50m
	Sq/v
X-Received: by 2002:a05:690c:385:b0:78f:984b:4be9 with SMTP id
 00721157ae682-7949ded7179mr84996467b3.18.1770032278094; Mon, 02 Feb 2026
 03:37:58 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Feb 2026 11:37:46 +0000
X-Gm-Features: AZwV_Qhz7lUjwfyHkiM9ZhQcOfXy-24UMIF7a894kKFHZzkiZQ_yfcubrDxtvZY
Message-ID: <CAFEAcA9yyLBa1Hp-2CrSsHBOBcGKSg6Rr3uvfZPckcRsTXDC8w@mail.gmail.com>
Subject: inconsistent SME2 ID register fields confuse kernel into reporting
 but not enabling it
To: arm-mail-list <linux-arm-kernel@lists.infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_033800_294340_7F57492B 
X-CRM114-Status: GOOD (  10.21  )
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

I noticed that if the CPU reports an inconsistent set of SME2 related
ID register fields, this confuses the kernel into reporting it in
hwcaps and /proc/cpuinfo but not actually enabling it (so userspace
programs fall over with SIGILL).

The immediate cause of this is a QEMU bug, but Marc suggested that
you'd be interested in this report for potentially making the
kernel more robust against it.

The repro case is to use a current head-of-git QEMU (I tested with
commit 587f4a1805c83a4e) and tell it '-cpu max,sme=on'. The QEMU
bug means that this gives you a CPU that generally reports SME2p1
but incorrectly has the ID_AA64PFR1_EL1.SME field set to 1, not 2.
(If you just say "-cpu max" you get SME2p1 with correct ID regs.)

The kernel's bootup feature detection does not report SME2, because
it is looking at ID_AA64PFR1_EL1.SME:

[    0.039909] CPU features: detected: Scalable Matrix Extension
[    0.039973] CPU features: detected: FA64
[    0.040017] CPU features: detected: Speculative Store Bypassing Safe (SSBS)
[    0.040093] CPU features: detected: Scalable Vector Extension

but the code that generates /proc/cpuinfo and the hwcaps must
be looking at something else (I think ID_AA64SMFR0_EL1.SMEver) and
not cross-checking whether the earlier probing enabled SME2,
because it reports sme2 and sme2p1:

Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics
fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4
asimddp sha512 sve asimdfhm dit uscat ilrcpc flagm ssbs sb gcs dcpodp
sve2 sveaes svepmull svebitperm svesha3 svesm4 flagm2 frint svei8mm
svef32mm svef64mm svebf16 i8mm bf16 dgh rng bti ecv afp rpres sme
smei16i64 smef64f64 smei8i32 smef16f32 smeb16f32 smef32f32 smefa64
wfxt ebf16 sveebf16 cssc sve2p1 sme2 sme2p1 smei16i32 smebi32i32
smeb16b16 smef16f16 mops hbc sveb16b16 lse128

The kernel commit I'm using here is commit 63804fed149a (6.19-rc7).

Full QEMU command line, for reference:

${QEMU} \
  -machine type=virt,virtualization=off,gic-version=max,mte=off \
  -m 4G -smp 1 \
  -cpu max,pauth=off,sve=on,sme=on \
  -kernel "${KERNEL}" \
  -initrd "${INITRD}" \
  -semihosting \
  -drive if=none,index=0,id=mydrive,file="${TESTDIR}"/hda.qcow2,format=qcow2 \
  -device virtio-blk-pci,drive=mydrive \
  -netdev user,id=mynet,hostfwd=tcp::4040-:4040 \
  -device virtio-net-pci,netdev=mynet \
  -chardev socket,id=monitor,host=127.0.0.1,port=4444,server=on,wait=off,telnet=on
\
  -mon chardev=monitor,mode=readline \
  -append 'console=ttyAMA0,38400 root=/dev/vda3 earlycon' \
  -display none -serial stdio

thanks
-- PMM

