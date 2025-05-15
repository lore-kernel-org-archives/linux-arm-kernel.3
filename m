Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEF4C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJL0KPlMp6DZzpx4wyF8HL/lXswTHi9cEl/RHcvMRDg=; b=ZpdbMYPG+E9PAnKs5EPkp4z6BC
	DVqtmMTwywfJceIzJ9eRH9t9ZFRTIVwKL6A0rRoRDYUOK/sR77FTaqe6MR3xmOLstq866o+prGvvo
	B641uzkxUP9jI/0JSzMX8q80wrEKpkAyF7GMBChiaS5AHcI+BBVwPntcwtVufI/e/Dkrhw1ofFFyI
	S3ZGPAi/Hc+mPfism9G0b12LorCg5tEudKZzTkQQa/4n0pPAjgZNIfaslB2klvJP6JPuW84PkFpz5
	aVgtd2LFFvC25bZWJrSCYqGCFXv20XKV83I8sSsKn7U7PDJclVCc5k00nfP1c0L7294iEecZGuNsr
	Wj0BZO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWnT-00000000PPC-1VmY;
	Thu, 15 May 2025 11:30:43 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWlA-00000000Oqw-0GMa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 11:28:21 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ad24b7e0331so140498466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747308498; x=1747913298; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WJL0KPlMp6DZzpx4wyF8HL/lXswTHi9cEl/RHcvMRDg=;
        b=OmJREQoGj8S9HO3axyXrZVBSUgQrXXUfDLqR15Hk0RYwdZv6YrFS2YJ9r2OzrgJYbX
         //tf3dJYnR3TtpHXARmh5qxg/g5V/j1BtZqqwY2fhkoyeTpPTrK9la8UM2u2I6Z+MZPS
         dc5YhzJ9Vt/UJSJiOdLL1msDcMnQehGrSY8O/iBp88PsD2Fr8eypzt+ftlm/D/SgxOaQ
         XwUEdNldDuyOEo3ryGJz+EPZWwzwIjtNpmz5U4H6AHtFO4p1H84hXb4e4hzFt4acLgYl
         1Pl8rL9g2icBN0lA394vpL7KqupC4znYV0+5KBffnCz8AubA1McRqEZ3tjG7caqHYgW7
         QizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308498; x=1747913298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJL0KPlMp6DZzpx4wyF8HL/lXswTHi9cEl/RHcvMRDg=;
        b=rFvsl+hYDik5hLKPAhsezRag4e/5OvjhE3IKAWWNw2LSVOp1dQGZWsSwozUrZEXvuG
         JmrEnPcYeqP7D2M6G1Ybo7GxVgcmOgZsyXkXkaiuPxGF9afsyxwbGCVJbw27uflTP6Vs
         XkwXSBmyv8FO0Icc6p5JFQ1k4oBte6x/9JIkQv019bt1DLmUrI6p9cwrmQuatusNDvza
         zLA6gBaGiFYBLzO2Lpmjnaaz+B2OgeiiEOEhwt+mhr+ZWFI3UVB3Dm7f/dxCbvqnbgoY
         X2ck0IZsZ4eYQeEaHXLt4iEpN1ppURflgHJ8FAPX2nNnQOjVsSkQ7GwUxQtnNjGU79nH
         Sg1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVm0S/C9mCuZws20r9WvSM/if9kb32uIKQyIv7v++Hh7kYZTF1fm2sa4vb4sqpOGt6zoNgpuAmuILe2yNA5t3GW@lists.infradead.org
X-Gm-Message-State: AOJu0YyLlifTOIE5mbVjjmfWBxZHC3cbhTbYMmPDlRtToghkqHyNgHYm
	okwpp70J1f8CeEpyJzDrC1o4Pk1UfMW89tGINM7kqQLnInB7Qn7R
X-Gm-Gg: ASbGnctaetb6STQ3OvFdhF9LjkeCNoE2nz+NQG5IWM4YdHH5hbzuPse2TzhjmsnFrcM
	cVR/97+tJruGruOAnHB92yi/iyfEII0T9tTLbdSsfw9zFqWDFpn9HhKYmupuGaOdo679cD7w7cL
	UDbd9eTkGoR6FRzpBCxIfQcAFbU/Lw23YDLjOyGI6YrANThZOKroLTxTGx7nIvPZJdCUgUY+sm/
	Ofjlv8z1HMmwCMGse0aPFADPWu/WwzmK2GwWX7hPjRxLB1vLhM+A/IHEfdOHR8X83T3LBbWp8uf
	UztZ+b6xX5JIHT6Ug9OjcoGHZ7ss9WVhi9DBwbO3P5pTCkBo5CXo0vMMKAL9fRc/wqM0CFgPYTK
	4LfjW0sD5idWj9UhM7KCGBuCghA==
X-Google-Smtp-Source: AGHT+IFhJS8thqNyc4H03aabnDsTjQOnAfvBj670xwICkIM30ExHIQVJjpRwvQeCLIt5Heh5jZmXuQ==
X-Received: by 2002:a17:906:99cd:b0:ad5:2907:eeb6 with SMTP id a640c23a62f3a-ad529080dd0mr2896966b.38.1747308497559;
        Thu, 15 May 2025 04:28:17 -0700 (PDT)
Received: from [192.168.50.244] (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23ad2b386sm909023366b.104.2025.05.15.04.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 04:28:17 -0700 (PDT)
Message-ID: <8beeddcf-1dc7-4af8-b287-4c896852b258@gmail.com>
Date: Thu, 15 May 2025 13:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
 <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
 <20250515092000.GF2936510@google.com>
 <aCW0822BVpfKV2NL@finisterre.sirena.org.uk>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <aCW0822BVpfKV2NL@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_042820_104271_093BDE88 
X-CRM114-Status: GOOD (  15.98  )
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

On 5/15/25 11:33, Mark Brown wrote:
> On Thu, May 15, 2025 at 10:20:00AM +0100, Lee Jones wrote:
>> On Thu, 15 May 2025, Mark Brown wrote:
> 
>>> Well, you choose 3 - I do think it'd be a lot easier to go with option
>>> 2, or with applying the rest to your tree as acks come in.  There seemed
>>> to still be a reasonable amount of discussion on the MFD bits (eg,
>>> there's some formatting comments still) so I was expecting this series
>>> to churn some more and was waiting for a resend.
> 
>> Yes, I expected to apply v9 with your Ack.
> 
> OK, that's about where I was expecting - at least one more respin before
> the MFD bits are stable.
> 
>> I can go with 2 in this case.  Applying in dribs-and-drabs as Acks come
>> in would be sub-optimal and would likely end up in a mess.
> 
> Well, then just going a head and applying them on a branch with a tag
> seems easier than delaying then.

I can split the patchset into two parts (one for MFD, one for regulator)
if it helps.

Best regards
Artur

