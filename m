Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA955FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHRKEeAne5F8MKTBpMczt1Dq5nvrp7CkygWD8nWgp48=; b=Uv6f9o9CnS3LkOvpl4cla+SWcg
	K5k9wDs0+O2hgc764Q/yORRm88E3z9c5iAInCPC2vi5Fv6Wu1tWZGV5WzgJO4OCrgOgQ7zG9mbI8I
	OgPjW9pAZVvVpAB/ZtjwTQwYtrCRw8ZfrASlguNos+Kld4+VV/M5aVmx84NWIc899yeExZRWa57CA
	RTezYrV/TlnvidqYx2p6czrFjRGdwaXceavloH4yFN4fM/DYQJxXi38bh76EuTX9MesncR5/G999Y
	5dUQRpTzjolEv+L2P8cKb5bsE1Dtyb7HYPKjW7hDp1QrgN7mK2hvY5xKrn1MCsq0VA+BWkTosYlxI
	sJ6uNl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQMd-00000005Ri1-1tZm;
	Thu, 30 Apr 2026 12:19:31 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQMa-00000005Rgw-2IqW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:19:30 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50d836552daso534121cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777551566; cv=none;
        d=google.com; s=arc-20240605;
        b=gnoCJWU5/eY8sp6PI11TlAKPF+nCMJCMsug7cdTASJph9gkzIE3r7EqiEDNSJYScJo
         gFMwQqJXyQ4V+mgDTZrO5tFMec17t9+bzFZRYAMys49Wdjmsqyie+v87zG6pu70DYH7L
         QY2WpTSCCLFXntPkTXfQMjemrHctiD1TG6mkikSdQ2NYoWUdbOAziIp9gpl3I4oz9xoH
         3/3pIj8Sso0lSlNwa41EegLWrT3JOz8XFxGTPSbOut0CfSnAF57zp3FpyokaV7MdohQT
         SoopxlUC104Yqps+17yWSLeNG7xlAo0FLaux6e5hwFCB/UsM4bQrOWVzwhcs1NhWhYBZ
         NDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wHRKEeAne5F8MKTBpMczt1Dq5nvrp7CkygWD8nWgp48=;
        fh=N3GX4yQIkmV41RqjCb/RWIFUYsHtwmAN2p5TerNSusI=;
        b=d2T7x8ygR3XL2gCQ7umg2SUMXKu5pZv1+vNyaouJuk78KfgRoojTe7m1jqDc+ULkI4
         uwGCNDcg0W+dhr1qyqyho8E/tthRH7YSS5D6ugQlD3K534u3YarMzdGomV3Ptg4YUY1i
         7tTscN0FmgsOghPVI4H5SpqQ/QQeKs3vj5sIm1Vn7H/eV0YtBADQdy5KncuUAP2F6vRN
         FnldaBB842vxIRf60kjJ3QsmqY4FyoYV1kLNMSsrecIC+/KtlSux45uQWVLd2C/+Q14R
         YDGBhmfU2w6iYMSVFIv8q+LFbsEbDiayOPJ8m0UFGutVyUJq8gGt2rQLovl/Bm1F0hY5
         6s7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777551566; x=1778156366; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHRKEeAne5F8MKTBpMczt1Dq5nvrp7CkygWD8nWgp48=;
        b=LdghoV6thWHWZii6TWF4bv7beuzfqYDYgLf9Ce5cmmquJwaa8E8NqXApFZwOmEVek1
         165RrE6kl35f4elHoUcfh2xpLnf21Abpt5rLVHXf1Toj3S1AP6tc4a7Rp/cZejw+fe2B
         dcXfvggoe2Zzlo2QDX1iFVkWm+kK0nGpXnIHhlF7++8IfhxZOy7/KDN9Va2yIp3oHtzx
         tTuddXuvhKYgNrgWx7atmKxszF0cRgDlkhb/QXRtNJ6byeEMycN+tImO+2E1wHZdufef
         7cg7qW9MC8cCSdF45889CCY/AzJow9zbjXYpIIgyL7mTnGBHdRfMEfedOhYZTt2Jv/Kw
         K0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777551566; x=1778156366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wHRKEeAne5F8MKTBpMczt1Dq5nvrp7CkygWD8nWgp48=;
        b=B8/e9TA5fio9GmqFFtkQlirT9PTMRUZviVTrCBRdLrzY3ENsbQmEiCdDpDsOHZXGZ+
         1lhwFflMiN14Whw4G2W/W0ciF+sYEknCYaKYF3Wv/YA6y2H8AMTBLoQVB5HT5Z72hMhP
         LJwRh7MTXxEqJjM2U/VpbWz7FgktyP8AXG23W3SDGkoLQzzGkIYk6UeDgW1o6Fsedd7V
         +EWBFNUFfrN5YYuuQi1x8FrmoOQCjcd+Q6FpfPWSL5lHdagfmH9Ofqdk6eQmU6EgRsib
         4VZmXiJ1XlHObyCknd2lhD0aONIEh+IBM1GtY4aMtCRooOaDa61CaIv9FAr4fbCJz2p2
         jyBQ==
X-Forwarded-Encrypted: i=1; AFNElJ84BhCLl+RjkmPJlYq5pU6/qJZZRWEuxlTlg8S6VPxeSEx/bgTLE44Zx3+WxRJvbidTfrQ5TUYdJRg6iMFZyyFY@lists.infradead.org
X-Gm-Message-State: AOJu0YxGfGjXeXd+O/V+4HeaJFcUTxElc8OJREgNCBoXbrnRXz0nye9g
	xAF81hE38PzoMLYtbBgZCiF2EdFeczi2nV1NlVd2nm5xy9sQ3OgBlQadWr4D5LLSDahszzH89Gw
	ewE9iAM6YQzsCN/90CqvYJUlBCLvlzRtnM4DyDqWZ
X-Gm-Gg: AeBDies9qSN/2hHqcGNEKH4I/5o0stEI45bISuZ5CM75VUi8Rz/cF1JioLVSBlzRMEs
	K59h2L80n3/fI1cTlXaWyiqdrAtkuFRSCz1mXhL+dLpTbuOunjS4moJ9w+5flGaPoJDv82zwU7O
	xO/pNGknip+8NvCegC9AgsDjeI9j+xuzel9VIQax1kNPqJpmypSP/WFPfU2tMIK+DJKFDiGSZFg
	DhBPU0oQuoSYL3kQqdbyNzDlYzdNw1BYm45d5PmV6gj8EGmDV8C3jazRIoayVNKea7SK5P9/I1Q
	2G+VotJlCOiy0mCXR7cfP1bn2HRTpH5T2cGtR5K0msD2yari+kL9vhBaG/k=
X-Received: by 2002:a05:622a:a6da:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-5102830838amr13557601cf.8.1777551565713; Thu, 30 Apr 2026
 05:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260428103008.696141-1-tabba@google.com> <20260428103008.696141-2-tabba@google.com>
 <afMb7uuPlUbLeu7k@willie-the-truck>
In-Reply-To: <afMb7uuPlUbLeu7k@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 30 Apr 2026 13:18:48 +0100
X-Gm-Features: AVHnY4KrIAjURaGJR0bOqEe6FW-ppWuYCbxV1LsE0PqXIXBObjOjW2F6E4sgXIQ
Message-ID: <CA+EHjTw6rx5rCVnR7Dfva3xmmgGjqUeUaT=3zDCEsN0J909Wsg@mail.gmail.com>
Subject: Re: [PATCH 1/8] KVM: arm64: Make EL2 exception entry and exit
 context-synchronization events
To: Will Deacon <will@kernel.org>
Cc: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, 
	vdonnefort@google.com, catalin.marinas@arm.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_051928_606022_E935429C 
X-CRM114-Status: GOOD (  33.74  )
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

Hi Will,


On Thu, 30 Apr 2026 at 10:08, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Apr 28, 2026 at 11:30:01AM +0100, Fuad Tabba wrote:
> > SCTLR_EL2.EIS and SCTLR_EL2.EOS control whether exception entry and
> > exit at EL2 are Context Synchronisation Events (CSEs). Per ARM DDI
> > 0487 M.b, EIS is governed by D1.4.2 rule RBBSRF (p. D1-7205) and EOS
> > by D1.4.4.1 rule RBWCFK (p. D1-7209). D24.2.175 (p. D24-9754):
> >
> >   - !FEAT_ExS: the bit is RES1, so the entry/exit is unconditionally
> >     a CSE.
> >   - FEAT_ExS: the reset value is architecturally UNKNOWN; software
> >     must set the bit to make the entry/exit a CSE.
> >
> > INIT_SCTLR_EL2_MMU_ON in arch/arm64/include/asm/sysreg.h sets neither
> > bit. KVM/arm64 hot paths rely on ERET from EL2 being a CSE, and on
> > synchronous EL1->EL2 entry being a CSE, to elide explicit ISBs after
> > MSRs to context-switching system registers (HCR_EL2, HFGxTR_EL2,
> > HCRX_EL2, ZCR_EL2, CPACR_EL1, CPTR_EL2, SCTLR_EL1, ptrauth keys,
> > etc.); examples include the activate-traps path,
> > ptrauth_switch_to_guest, and the FPSIMD trap re-enable in
> > kvm_hyp_handle_fpsimd. On FEAT_ExS hardware those reliances are not
> > architecturally backed unless EOS=3D1 (and, for entry, EIS=3D1), and
> > whether they hold today depends on firmware initialisation outside
> > the kernel's control.
> >
> > Make the guarantee explicit: include SCTLR_ELx_EIS | SCTLR_ELx_EOS in
> > INIT_SCTLR_EL2_MMU_ON so that EL2 exception entry and exit are
> > unconditionally CSEs regardless of whether FEAT_ExS is implemented.
> > This matches the pairing in arch/arm64/kvm/config.c which treats EIS
> > and EOS together as RES1 under !FEAT_ExS.
> >
> > INIT_SCTLR_EL2_MMU_OFF is left unchanged: that path is used during
> > very early EL2 init and the EL2 MMU-off transition, neither of which
> > relies on these bits in the same way.
> >
> > Fixes: fe2c8d19189e ("KVM: arm64: Turn SCTLR_ELx_FLAGS into INIT_SCTLR_=
EL2_MMU_ON")
>
> I don't think this Fixes: tag is accurate:
>
> 1. That commit doesn't do anything with EIS/EOS afaict.
> 2. Back in 5.12 (when that thing landed), SCTLR_EL2_RES1 did actually
>    include EIS and EOS
>
> so I think the issue here might be that the auto-generated sysreg file
> quietly changes the RES1 definitions as bits get allocated, but the
> macros using the RES1 definition don't get updated. That's a pretty
> horrible pit that it feels like we might keep falling into :/
>
> Looking at 0a35bd285f43 ("arm64: Convert SCTLR_EL2 to sysreg
> infrastructure"), I think we ended up dropping a whole bunch of fields
> from the RES1 mask (which became 0!). Have you checked all of those?

You're right, fe2c8d19189e didn't touch EIS/EOS: the SCTLR_EL2_RES1
mask it pulled into INIT_SCTLR_EL2_MMU_ON already contained
BIT(11)/BIT(22). Looking at it, I _think_ it's this one:

  0a35bd285f43 ("arm64: Convert SCTLR_EL2 to sysreg infrastructure")

After that commit SCTLR_EL2_RES1 is auto-generated. Because the
sysreg tooling can only model unconditional RES1, and EIS/EOS are
RES1 only when !FEAT_ExS, the generated mask is UL(0). I'll fix the
Fixes: tag in v2.

On the wider question of the other bits dropped from the old mask,
I went through them against DDI 0487 M.b =C2=A7D24.2.175. The summary
(SCTLR_EL2 with E2H=3D0):

  bit  field    E2H=3D0 status                  kernel cares?
  -------------------------------------------------------------
   4   SA0      RES1 unconditionally          no
   5   CP15BEN  RES1 unconditionally          no
  11   EOS      RES1 iff !FEAT_ExS, else RW   yes (this fix)
  16   nTWI     RES1 unconditionally          no
  18   nTWE     RES1 unconditionally          no
  22   EIS      RES1 iff !FEAT_ExS, else RW   yes (this fix)
  23   SPAN     RES1 unconditionally          no
  28   nTLSMD   RES1 unconditionally          no
  29   LSMAOE   RES1 unconditionally          no

The seven non-EIS/EOS bits all fall under the "Otherwise: Reserved,
RES1" clause for the E2H=3D0 layout, with no feature guard. Writing 0
to them is a no-op, so dropping them from the mask should be harmless
I think. EIS and EOS are the only positions where the bit
becomes RW (with UNKNOWN reset) on FEAT_ExS hardware and the
kernel actively relies on the value being 1, which is what this
patch addresses.

I agree the auto-generator silently zeroing previously hand-rolled
RES1 masks is a real problem. Happy to look at either teaching the
sysreg infrastructure to express conditional RES1 (so config.c's
AS_RES1/FEAT_X facts can flow back into the header masks), or at
least adding a build-time check that flags any auto-generated
<REG>_RES1 that shrinks. After this series, though. Let me know if
you'd like me to take a stab.

What plan to changechange in v2:

1. Fixes: 0a35bd285f43 ("arm64: Convert SCTLR_EL2 to sysreg infrastructure"=
).
2. Add one paragraph in the commit message explaining that the bug
landed when SCTLR_EL2_RES1 was auto-generated to UL(0), with a
one-line justification that the other seven dropped bits are
unconditionally RES1 at E2H=3D0 and so harmless.
3. Code diff unchanged (still just adding SCTLR_ELx_EIS |
SCTLR_ELx_EOS to INIT_SCTLR_EL2_MMU_ON).

What do you think?

Cheers,
/fuad

> Will

