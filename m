Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B11C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YIyBTYTKojaf4BmHidMuZkB2sDxpT30TjkIMwtTPhw=; b=bLMqjoUSUjndCsOuEwbyxOdj41
	YWBsTHO5c2rtMV7/Dsx2EF8R6kNmNKyL4zDP11VqMyUaex1dLiYTuZYiZBgERtA3cirUAQuFY5phK
	jw5p0BNOWR09tN2KL6V2THrjA4X6rd0IKz1ccpjWQJNNk2LyX+YPt/k3hLSEzWc3Ai60lYLm+ljrt
	YaxGmBDNgPDVSML0QXXHRLU8BI8ED9875/IDgQ+O/lLza4+arTRN5WwjNCpwZVf+JdjYx3iMep4j3
	Jxw16vJSj7JJcG+CQ8EzkZ5Co3jRaWiPY5QFOJ9v9mMrMlWMLuFCZnbVATVP0ORZSc5p+QltgDsn3
	E0SJ+Jsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90XS-00000005WJm-252V;
	Tue, 22 Sep 2026 13:28:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90XQ-00000005WI8-4BaW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2YIyBTYTKojaf4BmHidMuZkB2sDxpT30TjkIMwtTPhw=; b=QK/gQktv22oVAyrxketuVcJJGA
	wR1FrKQFAgkZQF/LpQqmumLSFqVljtulrtVOZQdDDs3Uob7wYiKPXSgGfbuWE1HDzhTI73W1LIbmk
	HS2Ci5vFlAoUUbpoK71DZHSgfLQks3tqFaAmZ9NTLCYavGfxlJBOtmW95LSDODSa/T053A1nXIhfW
	rRII9IA8coNaH97bx3bPaciUtdOoKuMIEwa75fG9BqktLUUZ13lRylQXXINEvdq6rJG3pjrj9dAP7
	/DQ5GPz/8TofPw6yYvvd4y4ED+rskEvgeKPm6rR3BhnZvOnlNwlHtMVcQO8yEu/m2z/55jFJcDQ/5
	nkMU70MQ==;
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90XO-0000000Dcp9-0gwX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:27:59 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f70553dso552314366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1790083676; x=1790688476; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YIyBTYTKojaf4BmHidMuZkB2sDxpT30TjkIMwtTPhw=;
        b=fMZuoWsJUY7hnBuK7IsYRBHKL53ekKBoA2jYpR0NuNsNJULacxI3a1n1TxtH29I516
         ukw+6ZtIliDQdA061d4JtQKd08oQR55IBk42XXmojoNxexe29QW7K7UOjj9EvKbWLe0y
         T93ZKjDtzYIBYyZAuH3q3s8xNNeHT+6az8I/+ZVtFLu8q06y/DktlnRe6kzMTDTn5tka
         9+ndKKYfndNLebB38eHTn8x0y517H7zBMZPlo+t58pd86hhAwjHOiIN7Z/hC7vgUBeUN
         vY3E0/l5hQ6ULrE5IaH0lgct8uZ8OmYnLh0Sqnj+0ovJ+Kj2HUmWmd12xcZ4WHDe26Ru
         i+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083676; x=1790688476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YIyBTYTKojaf4BmHidMuZkB2sDxpT30TjkIMwtTPhw=;
        b=kvbqTRr+iA44UMQsjtBqugPmgexrXKVwvjRnytZuunDpmvFojfxIs+u2a/TRAs3jHR
         2Gw0NSApA3EuLLzBEjhfN1HRUl/47GdZYQs8opL5jLIoOUSsMKZ5rkyJmM4kbqPwjvFG
         EiI6+NPJGe1hc/C/2nOyFhDP8/LYhLx6/Kbbcl9EonmDolaPdJuMV3Ju84w4sUj314be
         lRfRDfWLE94N4me3DrulX2Zav/dL7s/ctWw/8lOUP2w0MdPinPGyQU5ssiwAk7liB6rm
         8e7R+XbSsoVRqY9kh731slbdbhta22Ay+FfPqK3WK6zSOxnRsdfeq/TzpY9hXlaGqe+j
         h4ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1FAIoPObD4b00kuO/gKPgRFKh8n/Wpj5pL/LtxAVKrzU+Zqp1fvX1TpGbRjLnKIy2N9OnI/L/17skwGPl/lTZ@lists.infradead.org
X-Gm-Message-State: AFuF++nNcq4UtVwCV+aciUZSksjPK4SNo9KYHP+2rqv3enV4SZJcECqs
	iB6WZxowd/37JBbAbfOW0VfbAaXnaqh9WFGgNaY3Nxhn9PkKMBcjcIq4BPgt/y6fFeo=
X-Gm-Gg: AYBFou1n0ut/e39sx9O9cYmYWdVqPohWtZcUmK6oTFCg32My27Z4dXBno0oGG27EGQ8
	O0dIP7pUfwodTvGnJnF7MxfCWzmTwHho69ja/oi/zgupNUO7hzWeui6sa5xXHwKYN/2uWWANLot
	fkDpxiKawOJN4v802hs1uQTmy/chmg7AfhxEgiAtZsNZCtaBXluOry8gxI8Eq5DtQgPK3S+YkJ7
	IlOIVlDRJDljxHOMy7c1zuT5RaDYS1JN6uO0QZPrXfvvvkUZpt07pFRIQj1U2u7Dj2pWLjYidlC
	YxNJffNpiabLHu54FJvk4fuY9MGLGPTnbnDIUR9WfKfynXRvyjdJwuc0oBKFhiwhSpkcZKr0orC
	SG60zIW6GO3OkIKxfL2uyo60B16bYC/RLXxRzLSLskR76M7fBKSuZKtn1GaX9/pkgtTTXDaaNzY
	4hrY0FXbBSNLVeUvtJElJH9Ru/PKcJXBWTHIIo3nAzS+nN1JGHqQYsEz6WBAtQ1EHtq3HOhI65Z
	fy1Mmv0D3sUUPrHGmtovVCMGe4apDXyIPS8AN2d7IxRz1MU61mwr7aA9NLwQw==
X-Received: by 2002:a17:907:948f:b0:c26:1648:a060 with SMTP id a640c23a62f3a-c2a15e0fdddmr1199501866b.27.1790083675881;
        Tue, 22 Sep 2026 06:27:55 -0700 (PDT)
Received: from ?IPV6:2a01:599:842:c46f:7b1d:31f2:7a17:2f4c? ([2a01:599:842:c46f:7b1d:31f2:7a17:2f4c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f249sm85420466b.21.2026.09.22.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:27:55 -0700 (PDT)
Message-ID: <968796d6-811d-434a-a230-f05da451252c@9elements.com>
Date: Tue, 22 Sep 2026 15:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
 support
To: Prasanth <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com,
 billy_tsai@aspeedtech.com, andrew@lunn.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
 <8cb38ff6-1210-4c5a-b0bc-b0b50dd2b9aa@9elements.com>
 <CAMFFDGjJcmpaQYHe=F+jpstbdk9-uXPKkBxLkJqAJRiyyTkBvg@mail.gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <CAMFFDGjJcmpaQYHe=F+jpstbdk9-uXPKkBxLkJqAJRiyyTkBvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_142758_335858_19221E8C 
X-CRM114-Status: GOOD (  12.60  )
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

On 9/22/26 3:26 PM, Prasanth wrote:
> Hi Tan,
> 
> Thank you for catching these issues.
> 
> You're correct about the defconfig. I used `aspeed_g5_defconfig` for
> the DTB build and incorrectly reported it as validation for the
> AST2600. I'll rebuild using the appropriate AST2600 configuration and
> correct the statement in the next revision.
> 
> I'll also carry forward Andrew's Reviewed-by trailer for the unchanged
> MAC0 and MDIO nodes, preserving the scope of his review.

Andrew has already resent the trailer, so no need to send another 
revision for that.

Tan


