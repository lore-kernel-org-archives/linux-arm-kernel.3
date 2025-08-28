Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C442EC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KriyZgiAZRJDnfHsymUHd3lqzo8k4QI+bEtwKwBmcAI=; b=PFygYP3WcgNyVKPvDLQDv36sac
	Yu38HR1GanV2FaN8Wx23dpaD6JAqXCxrM3W61PKf8sITGYWiiajWxsxCaX8qscCTzg3N9djkIcw0S
	ldPLHw+GYOWJ0mribXI1Sv4DG9WNYo5pqPZERcU6s7A2TrHhkSe5nR9LXMNxlLTeY+W83WYDrcSh+
	ze/w7QKWBRzVLyWYBcyHnyqbjWpcoh/UANSXYr58i850PzxQSXGpLJfM5WR4+6WnsWuzg0tRjpByx
	EPb4rpnAG59tIE8g/1lTEmgWT156vfalrwhcKDXTmpkvqbSNzQO+C6qaBdH6SEulsS1GQSaZ4qqez
	RnBniwLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uragV-00000001Kge-17HM;
	Thu, 28 Aug 2025 11:20:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZpy-0000000195k-1KmE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 10:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756376793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KriyZgiAZRJDnfHsymUHd3lqzo8k4QI+bEtwKwBmcAI=;
	b=I9+wJUjCWMWKsXEC8F0EIYeIfWv3MLvtWOehQANpiV3rfgilBWYciEDh/NcXFnRoor32Gw
	nGDUcHZhjMs1Jcg5yi+kEPeKhhI7duPWQRGTINrf6CLrWzwUWPeBB4mDAHrN+mMcPa2Xty
	XkJMZff2Kf5DgofQ0HUTmYwZwqiantI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-xP3E2LPPOu-VsUJJvKMdTg-1; Thu, 28 Aug 2025 06:26:31 -0400
X-MC-Unique: xP3E2LPPOu-VsUJJvKMdTg-1
X-Mimecast-MFC-AGG-ID: xP3E2LPPOu-VsUJJvKMdTg_1756376791
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b0c5366so4956295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 03:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376791; x=1756981591;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KriyZgiAZRJDnfHsymUHd3lqzo8k4QI+bEtwKwBmcAI=;
        b=hOPxEoQ1MikYvAobfAHvEFTyrQhSG2dKqxVVvr8RoEuBSdXtz0da73LpBiMw+wQsF+
         wwVPiJ+zyO3MrGtUb+erbHH79IQCnW1IFtc3mVPhdeZLrF7ZC2rIly+fBuSSXEnxwCt4
         lydRN1bBT6gLYWUI/J2jk4lJg69VNRmyaF1EdPC4qIDokkY3Enb5I4dqSkfrMqwvZKev
         WBaLwFduFpNwxE39om7sK2QZFEDHX6S9ENKcXoLKcr8tMgwiPdlusALQi0huWxccXW2S
         QgtzZUGABH9sHxK/R6hpZQ9cFL9rhkUc8PUiaPNGHUY7JjE7uY4M4zNCtgQKkAyX+GP1
         RC0A==
X-Forwarded-Encrypted: i=1; AJvYcCVXMt16nC+pSgLqWcnM+kWW4/tJBjpXbBW4tdLSl438SiHtVt7/YTazc/OSkTpGzdimifFDGC+o+sLH43rymGbD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3N3bWJWFHYnODr/jSclbXe3c6y7sf8JQr4cPHF95nTGGg+kp3
	AkA+RRIZwdxlpdGiqDds53griB7LLjAYEyJCSqvWzyMKp/r3M2F7DQ6dMLbFZQpyq/8I1i72TD6
	y8im3mEvJySC5v8s1Oc0KaYS4Wv1kMGJYRYDhf07E9crZHvz7kpP/xaK2n9cV6i9aXzBIzY5XJc
	6d
X-Gm-Gg: ASbGncsL2l6el0II6XjEDP3upVF2XfQnCwv8M2/RFHHFOTIMt51yU9d7rA9pnZExETP
	dFS+jXAiy5er0n+rUZLqoMnicXphCKFI3cOhy2lwDvJfzQztvdfRh0h4KURd2uOMuPr+Ydtag4l
	Bmd9jbierNcx2fAWKO7mHD7ai+YIAAIeMW2GclZsZt82ZCtcRGFiKErsMjdMs0iiqC1JXttLsS+
	g52XiiMtLdRYb9M8c0jj79NsnX4nc2BQC0C+hqENsY45eqtyFbcdHO+zXof/IY9Z4aSUuQHEKwx
	c+AP34EfTqyxMyCvW8kEs6fEuGj9fWbF9Dpx1/FU2bSCzwwS2YURGMcCnJ5HK1hdPNChNjgo3DK
	yby6PMFFWMoMy/6i6cIaAKEPSyjOWt03DozQV57dMklZseW/KDRcNWD7wIZIvpAzScdI=
X-Received: by 2002:a05:600c:4f4d:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-45b62586a5dmr114585805e9.23.1756376790562;
        Thu, 28 Aug 2025 03:26:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtFlmG2bk+e9nYytQDuLDUJ8uuAXsdALOuDZVwchnxhUM2yFRl9mv4ZYrhg+X+WjfZRuMlZg==
X-Received: by 2002:a05:600c:4f4d:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-45b62586a5dmr114585345e9.23.1756376790087;
        Thu, 28 Aug 2025 03:26:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:c100:2225:10aa:f247:7b85? (p200300d82f28c100222510aaf2477b85.dip0.t-ipconnect.de. [2003:d8:2f28:c100:2225:10aa:f247:7b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f31d083sm67062965e9.24.2025.08.28.03.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 03:26:29 -0700 (PDT)
Message-ID: <093db25e-12d7-4372-873b-72f189117936@redhat.com>
Date: Thu, 28 Aug 2025 12:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/12] KVM: selftests: cover
 GUEST_MEMFD_FLAG_NO_DIRECT_MAP in guest_memfd_test.c
To: "Roy, Patrick" <roypat@amazon.co.uk>,
 "seanjc@google.com" <seanjc@google.com>
Cc: "tabba@google.com" <tabba@google.com>,
 "ackerleytng@google.com" <ackerleytng@google.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "rppt@kernel.org"
 <rppt@kernel.org>, "will@kernel.org" <will@kernel.org>,
 "vbabka@suse.cz" <vbabka@suse.cz>, "Cali, Marco" <xmarcalx@amazon.co.uk>,
 "Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
 "Thomson, Jack" <jackabt@amazon.co.uk>, "Manwaring, Derek"
 <derekmn@amazon.com>
References: <20250828093902.2719-1-roypat@amazon.co.uk>
 <20250828093902.2719-12-roypat@amazon.co.uk>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250828093902.2719-12-roypat@amazon.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z-zDFllG_jNUazx8WGus8TbOZiy3fUlDlLwVjvb-MKg_1756376791
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_032634_496030_80C314C4 
X-CRM114-Status: UNSURE (   5.74  )
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

On 28.08.25 11:39, Roy, Patrick wrote:
> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
> ---

WARNING: Missing commit description - Add an appropriate one
WARNING: From:/Signed-off-by: email name mismatch: 'From: "Roy, Patrick" 
<roypat@amazon.co.uk>' != 'Signed-off-by: Patrick Roy <roypat@amazon.co.uk>'

-- 
Cheers

David / dhildenb


