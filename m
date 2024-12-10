Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF10BE77182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0dTmTZsOI9hQmaca48zwWtaCXiY2ZalD73VTkV/Wfc=; b=QZMJoLMW6iXshz2yI17X8edlju
	0ouNXOxANN3t9nVbGo/n5TVfWDZHjh8ssqhESmzmBfxdOJTOks/rvIn+gp4fL+VGqrT6XO4WBstCU
	hHK2iOCd7qGj+rRw+63yDGY54YLBdo2K3MJd7Dlu9vlJ5ji7jrsqwzzC41gnZm+Wica1iAwdmO2ab
	AjO1tmJYkm6b0QVP//PntB5WrPAbLA5b4Hp5U51r0S/6LwCe9lMuvwz1zbPZofryqXIO05s2mYBqP
	GNWu3eROPwROkWvNH9aKv/+34aeSKQTNB2zTgWoBATkSYAj+vbMgd67aTty50a2GSkIKPFS0/NQAj
	ohqETM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6Dx-0000000CZKw-1EyX;
	Tue, 10 Dec 2024 19:48:49 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6By-0000000CYyz-3zkJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 19:46:48 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa66c1345caso244389066b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 11:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733860005; x=1734464805; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A0dTmTZsOI9hQmaca48zwWtaCXiY2ZalD73VTkV/Wfc=;
        b=R+jrz4jssAGdJC4kxEubhO4XqTLUlZq3lLgd+tCDVLG9Td/YmedToxYfDy3xbBbQ3y
         Qrxk67jdiw/ZuXyiCDFauO7noOj3Xr7le7jGukD7CjmcrqDN4Cs9LlzgZcla98cmP6Ka
         kZi8Uc1yMe8JBvwotlwtJ3MVjlWufi87aK4hDxoEjipdYXJz0Lxz56hDlMvghd/5UazR
         c7HH6Moh6UgiSPSJfs69QTmH3Jc3jqCuIKt8+merK91bb9At99uXIBHi2WDwIeG7EaR+
         O3rgKSuVnLwVHkxlmo8hZ1j7gXOafZUcHFdp/HBVlT/XjptKmKXII9d1VAISZtL5b1XQ
         /1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733860005; x=1734464805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0dTmTZsOI9hQmaca48zwWtaCXiY2ZalD73VTkV/Wfc=;
        b=wioTrAfeEAaulHSlqWiKHvr16eOunMchYZ1TiN3RnzyodZ9r3+ZYfRnaeA2GY/i18V
         TJR387MS030D2MezNnMVVQJ422ypHl7RECxVBUjLGoY56dIgao/wNASCSObuHUUSxZ5G
         qdvSI1Y02KERw75HAf4658yUjm5icEVs0Jmna4wHQM3axvdmfs6GiCaaEdBEDVNS59Bt
         JLMEQPmgdSk/rDkAx2BD9tVR6NvQUtMYnKdogRqSwFUqPBDDurdDr2k09vwbszNygsFz
         kANp7oK9Kd62INnIwfwkfWJASxiXTUoD6RrAqHZJjXHSPMBsfQ9JYnVGwqBLPK5/F6S4
         S10Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcUlWT457fIH7dct/XCXAiW5X7sS4nTPcIK+P0MpIiHjmXFaJlUPE0B+WwD7nL4mJqcKx36mpU3k4COayzBk24@lists.infradead.org
X-Gm-Message-State: AOJu0YyU3AbaaOOjy5PZIt12DK4vjXknSucYoSpljlhT3lkLEzT5L+to
	JBULz36D74ak3/SWwpOXkRfwKETbpOUf5LQtIEkGjPFyLRIJ+LbAdMsSc2h95A==
X-Gm-Gg: ASbGncsTLu0MK9IekkxfGjUuIkWZW02d5qdJOWV1joSVfhlBXECI0IrrW95ggcyfn7m
	eq63ixIkhWYZeTmhA3uuK+WZtd3PH/hjjMq4aLL9j+hGYkKN1NEgjFOFyB5bUVtAGhl2pucodCW
	zk2baSv4Na1BUULmkXDdD9sfWBgE1ZxCk8VgQmAZbqrRl9vSAe1CGeGWMiYun3c+kZC2MYVf+Al
	LQE1Xxp1paxXMdc4H3HeJ+P0N0sOjSjKC8OKvoRdX1bpy6Fy+2JXtPBX22StJkrywj1XM262HnQ
	XzJgv+MyKEWC
X-Google-Smtp-Source: AGHT+IF8OXUsJlvVq2WfJtUgUFxuNR6rqta58L0bNZagCkPdnarHQO7ASCTfCCHZ8UICmUNDGta8LQ==
X-Received: by 2002:a17:907:7819:b0:aa6:ac19:b579 with SMTP id a640c23a62f3a-aa6b11eb111mr4655566b.26.1733860004764;
        Tue, 10 Dec 2024 11:46:44 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa692e4e9d5sm296409866b.129.2024.12.10.11.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:46:44 -0800 (PST)
Date: Tue, 10 Dec 2024 19:46:41 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 15/18] KVM: arm64: Introduce
 __pkvm_host_mkyoung_guest()
Message-ID: <Z1iaof2DgZfZxc4l@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-16-qperret@google.com>
 <CA+EHjTzOjwNyUkS5_zSUiAbiCauLKKgkKU6TM_-+Wsh9A0FdRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzOjwNyUkS5_zSUiAbiCauLKKgkKU6TM_-+Wsh9A0FdRQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_114646_986965_E86CAAAF 
X-CRM114-Status: GOOD (  11.79  )
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

On Tuesday 10 Dec 2024 at 15:14:03 (+0000), Fuad Tabba wrote:
> > +int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
> > +{
> > +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> > +       u64 ipa = hyp_pfn_to_phys(gfn);
> > +       u64 phys;
> > +       int ret;
> > +
> > +       host_lock_component();
> > +       guest_lock_component(vm);
> > +
> > +       ret = __check_host_unshare_guest(vm, &phys, ipa);
> 
> While I'm bikeshedding some more, does the name
> __check_host_unshare_guest() make sense? Should it be something like
> __check_host_changeperm_guest(), or something along those lines? (feel
> free to ignore this :) )

I understand the comment, but not a huge fan of 'changeperm' as that
sounds like we're only allowing permission changes while we use this
all over the place. Maybe __check_host_is_shared_guest()? Naming is
hard, so happy to take suggestions :-)

