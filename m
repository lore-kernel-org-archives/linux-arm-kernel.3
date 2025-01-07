Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9008E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 06:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orCDsDNFA6uclIQ3/usGvXWL2lE5OsemzFx60WJJZsA=; b=mxjXH8J8x2nqwmrnxPI1X8cyQq
	hHrYtFTEmGHkFaZFn0Q1zabhPXZZZdw1i4pIjLJaUZQD5qib6VfRImzsmzJVd62WHlSTL0aQU/MTb
	jath/agFFXfdQ7cAoYcZCULMb858UyrVKjwr+8Oniv6cmRLTiRkOKy0iGGICm0qmZI6ujdkSN79jj
	JQ9OYHcyVmJwZ1sYLBtTmj8+TG7QLr6RInknuumaLHlkB6CW13xeQ65tndtBTPqMZg0DmWvP2MPJf
	bYG5Tqg9tjyKur8fOodSi+BeWFVwmMfA3REb4oGZSHXNWuBFIO/N2tkOZJIag6jwtCk7aWW3qsy/v
	3SPxUd3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV3FO-00000003fhP-2JJD;
	Tue, 07 Jan 2025 06:39:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV3EA-00000003fYi-2NOs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 06:38:11 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2163dc5155fso217277405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 22:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736231890; x=1736836690; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orCDsDNFA6uclIQ3/usGvXWL2lE5OsemzFx60WJJZsA=;
        b=PsrluRT4HLU9uWkxvO+UpGnExkFv4v58eYBoLzepc2ZeHGJzi72QAGgXEE1Xd9iSev
         wZ3+gzlGHh15RM5pnnv5ZCaDm2BXCULaeE4CCpqraZOhjugdDS7Gx3Y2YBlV8s328emL
         sll8jA+Iq44Kn7W4cWsN0JXeqIfDnSzTvR/PpDyEl2DCjQpLZ3IHSlpRAZrruqCb0OJB
         3IxHYq2hvEXI5+Vih+b5V0RyC05b8bSeMEh3fZx6alRXITxzwN5kuFMvy7k74wF4Buay
         vX/XCDQeabT6BOSymJPUEPrdO9mw7A8OC9WNWv8VM6VrFjZVGXzswzPW/1h7ZanyVY8P
         qB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736231890; x=1736836690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orCDsDNFA6uclIQ3/usGvXWL2lE5OsemzFx60WJJZsA=;
        b=LQZJDKjtlhM1Ow4WkFBx4LZouPsGFXLnivnbvDsMTb/O7tutT0eI+x5r8G8JVK5uQp
         ZGMBekR7yL/ZvkERzpEdesxKNwx9N77izw/ZUimiGbkaTHSkuFbz+FohHjEWctUqKMsv
         zE4zjQDSmNi2BgfC2DrMehKuyUrM5FAPBT2aLvXNrjDAjYnIllXXbiZ7vcCzLG9BKqlg
         zt8wbVSCJeJaOI+/RPcE96AQt/J0521oTdGxco2ywAYFMGJPbvU3GjxKDrc7vwWqC2zk
         sT01xKQVigP8OuxF4X8i3yHnUJM/U0iWXiYwbxwg2OFeA7TGt1YBShNKBIfeTABFQKCM
         LgOg==
X-Forwarded-Encrypted: i=1; AJvYcCWFL/f+RRzVjI5pVzBV7ovNArW8PF/bK3ZjrsQqLLdKfcySyHqtgYygjcPrti68fnSgpweV5Vb5Oarefjo5M2uy@lists.infradead.org
X-Gm-Message-State: AOJu0YyM4JYB6pySA8vAOkfvq7+5uT/deS7B9suPy+imRJorQ3Af92YA
	UJHkPNhLcmhzbeypHqLzV8/u1DspDyv77T2mYBz9HbilSI7gGBso
X-Gm-Gg: ASbGncsF1I0LdamrX6uXL1X71Xkoemi5tAKtMlAaY7A9B+/Xx5eXTi0r4mQxub9hcsK
	I8vI6xnz5HtMxqTVvtDUap41pbb2dcsETiIm7HsJufac4YxjT4m8AS++Hcajh28jDG+zWu5RtWa
	CEkE3KMbjvog/IGFfzmyINYRl+Uo3k4kqxyigPwwvO6DQrknYTbTS84EsWWPRfnILM70nnJJo/e
	7OEngvbMkJ02OJQUJkHkK/w6LSmjt4C4auelVeFAHf64GMPuEXj6hXu0070vLE+o81kcvRuebky
	fIeT3iyEnCTnCOV/BccWU3Btd4mfR6OpPNM=
X-Google-Smtp-Source: AGHT+IGWjFIAveI9yo5Dqy+7qm6ujTkxPVuxedvySkpkmuvq5Mxo0g2bGXtAvQZqm2ic1gDjzturbQ==
X-Received: by 2002:a17:902:d2c9:b0:216:4c88:d939 with SMTP id d9443c01a7336-219e6f133b6mr907204635ad.38.1736231889846;
        Mon, 06 Jan 2025 22:38:09 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f5227sm305467095ad.185.2025.01.06.22.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 22:38:09 -0800 (PST)
Message-ID: <39e559f4-375b-4e4e-8c81-3d1d8858e839@gmail.com>
Date: Tue, 7 Jan 2025 14:38:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/3] Add support for Nuvoton MA35D1 GMAC
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250106163054.79cdd533@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20250106163054.79cdd533@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_223810_609261_36D50BBE 
X-CRM114-Status: GOOD (  10.57  )
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


Jakub Kicinski 於 1/7/2025 8:30 AM 寫道:
> On Fri,  3 Jan 2025 14:32:38 +0800 Joey Lu wrote:
>> This patch series is submitted to add GMAC support for Nuvoton MA35D1
>> SoC platform. This work involves implementing a GMAC driver glue layer
>> based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
>> interface capabilities.
> Would be good if you could reply to Christophe's question.
>
> Then please rebase on top of net-next/main and repost.
> The first patch doesn't currently apply cleanly.
> Please leave out the second patch, it has to go via
> the appropriate platform tree, rather than the networking
> tree.

I got it. Thank you!

BR,

Joey


