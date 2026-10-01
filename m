Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EA7CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKUYNiypai7kLrBWG3nD+p6XOiO4JTXe2gBJkoMuZZs=; b=ccVB5X3gLxqoLfBYZbt44zJmc5
	wkxsh/7bqH82ZsxCLIeMWr/2eR7+Mb5qVpf5RoQXcSCSS04GInCR+7VAMu5y1HsO13/7QAB6V7c1i
	EW83lnulI4URJj3lxVsDrCyU8V7vZizdB6Nx+3RrW85ytKhTsEL35msl6GOUocs6xzOvx4wwxfwzQ
	NnAuIIPiCEENCvHSLiG4TZVZS0qh8dOSz/ud7zpJfUQ6RWe48NsUGsAbhjffon01lBLmbk3xHIvrt
	7Exg5xdW/JOWBV8vldHli5z+EIAytq+izWcU8S1SjJwuzzPPaK21jT3Mauf6nmCnURG5uHDSDmnvl
	bUgYw/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGxZ-00000009Fi8-2pef;
	Thu, 01 Oct 2026 13:36:29 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGxW-00000009Fh8-1poO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:36:27 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id DB216EC00EF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 09:36:24 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 01 Oct 2026 09:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790861771;
	 x=1790948171; bh=SKUYNiypai7kLrBWG3nD+p6XOiO4JTXe2gBJkoMuZZs=; b=
	VvDRdSZtUJ91YFd04mz9RUzz35HNlZUh7TEw7YzOHVekM1BW6tcLtInHbfvdQiqA
	XhdxD7P+uAATqx5X8hqHZcattbfj6uZ9/fl17LhooVQNK1AV9CUFb1xI7ZxaXfCD
	Z7tWguPZnZY3FChQU8XgErS0hYWDaStHU3zInGmhFibwTefUi8APey9Rs9EK+qKs
	Y46ld5M4tPhuvi23ohHBunc7P5w/LW6xTKacwzQSneV1+aDTaNQ0qCTYx110TF4m
	hDhFnctmCxVE0WwT1X9BX8pYIFyKYuu581X3tYGwnm8tXVuEcCnP1z1mnWe7Mg+D
	GEeoxoLgjLGC+TweEJbIRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790861771; x=
	1790948171; bh=SKUYNiypai7kLrBWG3nD+p6XOiO4JTXe2gBJkoMuZZs=; b=I
	DAYof3aoUb1jIWC0aE7GpF8K2uqSIVxjo7lR1P4DYnO9c7ucxq4b3z3KmYo9Ja33
	zxSQ1it6vUi5BS2u/Zh5g46OX4WjbPssVEoCuPuPxhrKPOuu+ZaKj/9IfmO/IQUU
	eWMD3xWTOpfv3lCTbnL6F7725IADO/WlJcLWALVPsUVKcfLr+L2YwzASn4TPo/tX
	k6z0kB94arXCDWXaGpchzDzbrJ5pkwqJ9jsc+gUSwSYqVfkh71OPu8NylpkDTyv3
	RQBVCjZaEYNHZSsRffHa9RwIIiSQdcuBS+jo7WqHKFHSFU3JXQwq7Ejx9eq0Jwfp
	ZH9CiWU0TZthCDENY1ftw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790861771; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:P4i4wDA2uFz+AUKymPZt2jxrx75xi3aG9E8vhIVliLhGm+p
	Mzq55GqdY4eN3PmOddMpdrp3Hf849U5lEOow2Ge6bXq+iZeu31GtbyW8wzjAV0HR
	ROIGnwHRnWT2MrQu+hjljMkjNXUyOoschMOCSK22S2ujKZ7G8P4nGmauNZaWe8Zx
	lINOC3gUn+rPMdULCZ/KYflBeXNEF0fkTLZx1DfW4ST0cl9UgBvDG0L4qnQ/Pl1O
	4Z/s8CA0ScyxZyIkJQC2mHAjTPr/0V8hv3aAYIYkkmYTJLvRBuxkTcNuT2y5yuiT
	1cDqrG3kQhs0kck16cP2IyXWXk2xo867wMpMoiA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Vf6G2uFBt5g/SMqwNP1CQ5JKkLzHs7yx0Is8nFPjNr8=:NV65feXFflscWUMvK/htMYfD00+MlH5rJ5rvLdyVtmU=;
X-ME-Sender: <xms:w2G-as3FOW5Su9ixLtcYD2rizq6FSZnQ1UzlpWpcGFYeRAtD_148Fg>
    <xme:w2G-ah462tCUOmZ27e7BC8S9pTm3uHr36TOSAkW0VeGSAVM-4gVgBdeFd1cdSLlPq
    5RmuiZRhYVz-zTW6w6CODADo1zHDO2z8et3MpIHsNylGdorAqJqvwSH>
X-ME-Proxy-Cause: dmFkZTGOjuD4Y2plX0P83V6Oh1JxLOsSaQVxEWXGa5YbUaA5+HvZPZ82BQbF5Zjgzi9sgB
    UslrslXyN6k1DbI5c7nK0czpyuNNXX6wzsaI57x3XsL3dqPiqv6fTMECn4PIwhTKKpOdzq
    Y3afhC5OWpNg2aGxIDIITKmQYEr59iMhpJZl7xD5f6RR1q1Yh04F19rPQKSsWOfnbOg2FQ
    8mQiGXxU4v86rv+SylJN+oD2GTi3jne/kEAdQQY8GU7ZXUExySPeYy1T70GXGtON08eoek
    l3Yemz/+KbymyUOuICi+nfZBqUGHAdcYhDHVWA/Jht+f7HJcN6ZSJ6hMhwEPQ2cypQfUdT
    LVr76rRISq50YkOpyqT/0aUU5mUfcEBl2kRCQ6mLd8xv97YjzHZ1hakavcpF9Qg/xo4dXS
    B7QnYOQr81nx+ehCilb7FZyxlais2+2GY0Z6pCtlesyxTyZulEzCAhglYGcnxOamSnCpOa
    oi2v6kCESKsB3ie9p16OU+xVosguu5ZcQDzvfXm+in4rGAm1lE0cAEkJLKQhLFiBeSQwo4
    wKYpmZPJd3yLYQ1u8zOfR0yM7xj71kIOp2cfXi473VZxM3M/j8Bu6ODOOxFq6qWWCcTzn5
    07JOocNansEb05HvK0bhrF4NhyiLfMY3TfYy97VmFJbYU7ITueRmAwWWxJzg
X-ME-Proxy: <xmx:x2G-alMk9K-u2tHb9j1ke0jLVLRnQBP5c7aIT-0NpInRWPb5NFOOuQ>
    <xmx:x2G-apN972XZhHFqIoXCLnFJQitPfczuoFtk99EAIpUwOH0lIIvdvQ>
    <xmx:x2G-ahXnYGouXYdfr4IM52XOfLLkBog4Rc-aZiJZCzoeOJ00ER738w>
    <xmx:x2G-aktEX2sUeC6E92aAPr93jXWY9viSl_BxstL0TjlljgxFSDFnmA>
    <xmx:y2G-avFJwlk2epnRG-kkO3KD7wavpP5bXOEvcXeTopAqBbHRU8I5ftTK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 037EB32A008E; Thu,  1 Oct 2026 09:36:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AyQhVaDaKSSk
Date: Thu, 01 Oct 2026 15:35:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Steffen Eiden" <seiden@linux.ibm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Cc: "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Andreas Grapentin" <gra@linux.ibm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Claudio Imbrenda" <imbrenda@linux.ibm.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Friedrich Welter" <fritz@linux.ibm.com>,
 "Fuad Tabba" <tabba@google.com>, "Gautam Gala" <ggala@linux.ibm.com>,
 "Hariharan Mari" <hari55@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Hendrik Brueckner" <brueckner@linux.ibm.com>,
 "Ilya Leoshkevich" <iii@linux.ibm.com>,
 "Janosch Frank" <frankja@linux.ibm.com>,
 "Joey Gouly" <joey.gouly@arm.com>, "Marc Zyngier" <maz@kernel.org>,
 "Nico Boehr" <nrb@linux.ibm.com>,
 "Nina Schoetterl-Glausch" <oss@nina.schoetterlglausch.eu>,
 "Oliver Upton" <oupton@kernel.org>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Sean Christopherson" <seanjc@google.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Ulrich Weigand" <Ulrich.Weigand@de.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>, "Will Deacon" <will@kernel.org>,
 "Zenghui Yu" <yuzenghui@huawei.com>, "Lorenzo Stoakes" <ljs@kernel.org>
Message-Id: <e1569c6e-94df-4609-8d94-d6319b4171cf@app.fastmail.com>
In-Reply-To: <e2742ccb-6b91-463c-a148-30b7e2f41e9a@app.fastmail.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
 <20260930173441.66762-24-seiden@linux.ibm.com>
 <e2742ccb-6b91-463c-a148-30b7e2f41e9a@app.fastmail.com>
Subject: Re: [PATCH v9 23/24] KVM: s390: arm64: Implement basic page fault handler
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_063626_769624_0183C1A5 
X-CRM114-Status: GOOD (  14.84  )
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

On Thu, Oct 1, 2026, at 14:10, Arnd Bergmann wrote:
>> +		/*
>> +		 * Check for a cache maintenance operation. Assume the guest is
>> +		 * cautious and skip instruction
>> +		 */
>> +		if (kvm_is_error_hva(hva) && kvm_vcpu_dabt_is_cm(vcpu)) {
>> +			kvm_incr_pc(vcpu);
>> +			ret = 1;
>> +			goto out_unlock;
>
> Hi Steffen,
>
> [Adding Lorenzo Stoakes to Cc]
>
> I see this function fails to build on top of linux-next, as the 
> kvm_vcpu_dabt_is_cm() function was removed by commit 18b94675b1fb
> ("KVM: arm64: Use ESR helpers in guest abort handling").


Another ones: after 34cfa9b3af17 ("KVM: arm64: Implement
KVM_PRE_FAULT_MEMORY"), we are now missing a kvm_arch_pre_fault_allowed()
definition in arch/s390/kvm/arm64/mmu.c:

ERROR: modpost: arch/s390/kvm/arm64/kvm-arm64.ko: symbol 'kvm_arch_pre_fault_allowed' undefined!

I copied the arm64 version without the pkvm reference to make it
build for me.

     Arnd

diff --git a/arch/s390/kvm/arm64/mmu.c b/arch/s390/kvm/arm64/mmu.c
index 7ee157c61d70..be16351acaae 100644
--- a/arch/s390/kvm/arm64/mmu.c
+++ b/arch/s390/kvm/arm64/mmu.c
@@ -179,6 +179,14 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
+int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
+{
+	if (!kvm_vcpu_initialized(vcpu))
+		return -ENOEXEC;
+
+	return 0;
+}
+
 long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu, struct kvm_pre_fault_memory *range)
 {
 	struct guest_fault f = { .gfn = gpa_to_gfn(range->gpa), };

