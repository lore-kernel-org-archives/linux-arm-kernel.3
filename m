Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB1CEDF03A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 05:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAvHmXBR6Z1t7fykOb+Q8OlteilYCII3PJTMYzVRo6g=; b=vIhM4hUonp0K+gN5AOMT2QGx7u
	BdxIEgOvJe0Hh4+a7/u1b7OLc533uPKnw1ZVWZ3yCjGEb3TSem6tbqz2d2OrY7MGl9hoSdxl6EwyS
	0KeqQENVvWD0AY54XbPSnELnjQxSZaxRlh5jGADPDQOADOrPD9Ia1YBTHI8BUYw22MNpN4ex6dQCR
	Na92okUoMCfwUhAT6KKTXU7b1aMvmVsz6KOaHDFAcpIJehg5GTs0fnWSBInBDQHeRFq4p7sNKQsVv
	p3CSpnSAXF/Sc6fjs+efPt6GgXAQ7pRpteTylyleRuMj8UU+oxIh1NYXi68mLdGA6DkydoddwN+ut
	eSCgz+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqPFQ-00000001eZi-28lO;
	Thu, 12 Feb 2026 05:28:16 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqPFN-00000001eZP-1NoG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 05:28:14 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8230c2d3128so1313624b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 21:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770874092; x=1771478892; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KAvHmXBR6Z1t7fykOb+Q8OlteilYCII3PJTMYzVRo6g=;
        b=OVBY8YNJ6w3MlKHnSHZGRA4+59LtjW4YnLSBcUQjaDGAT1OolT66Im6vYEkZHE3Vir
         +qaVKct21vp2uu4Vpif8P0bLq273D7ubUHG6vqztvhabADy3gfOZsaS9TKopnCu1mIqJ
         yEC/y2OiTr3kq4xxRZcyUtJf1IjKVtQu4xv+P7u74a8CI/Rmc49Ji9wcLzPCT7ZugtRT
         E2K74COsh3vaicaIbz59dK5FDCuMpt6NIC/pcAcOESDALpMNBdMWrRYc2Dm1NViCfk8e
         swrXEdx8b/8NiYu3TIW8bwE1xaTUjW/iWbmd/GW6ugyAa2yZXuzGXoitXrVAZuR4gjRp
         smhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770874092; x=1771478892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAvHmXBR6Z1t7fykOb+Q8OlteilYCII3PJTMYzVRo6g=;
        b=oe7vToVW45cRZjnSf5sEX2AHG/eaQSNqUerjK+b7t6fDr6Aq2LIPrwwigSYMEGTSkb
         Ypm1z+VdFsofFONGi2vU39M8H+iTWJItIiHH9BB/BTtN3pfoq8N/DwMCh83nuL4YAfB7
         SrqMD5kU8nnU7P74Ade5tUG5jpMkouAYExTWyKMT7/SZHNjhXeGQUTMVAQ/S/exfra0I
         5xGdmOaT+5G0Dyi18avFFaEVohHo3dmU8WS8KmXgX8/NM2yW4qORcQ2tACIpVweYkzqu
         JFz7BQviQa6k/sJAPWjYP8Pb9272Z8VtpG3Cq8YUWQiocC1ZD/WOeKAakbCQfX6TOCcb
         FQSg==
X-Forwarded-Encrypted: i=1; AJvYcCVgRnHRvmMQQQkBkO8P2WAKoTL+IpfzYm0rqNwP3bfbiI/Ahb/BZPdm8PnA8UcidRNWaUYtJrpkIMUntVX3H8qv@lists.infradead.org
X-Gm-Message-State: AOJu0YyYnm5bo9LDKZJGufSm5uibIOSBn01gAD9Bi4E/Nc+P5O+TDQS4
	4gI6gsKMLXmRn0PzBzn+p4p5g7TbECkfGhoJ8IleCZmOxky88miqxay3
X-Gm-Gg: AZuq6aK5RdGkpBebdPAHcgyFm7VsVlsBbdt7KM07NcBNQtg/IDdHPFOBrTds1ZVNBtH
	wSdqQdgZPKlLT1wsbZU8lrGK1bPeb5I/qUHMI5EaCZ0aPFrsW/mJIz9oZT5G5Wdg/KoULp7IWTR
	X8MxVrve2G6A05v7IPmpbcnLXFyhStO6uFpYKJie9XqIH9FblvUapNOweiSJOc/ymjlFFCIVxFG
	eUQ0txbuj8xkeXnxzQWeBf6s61R6WkaXHuVI2+QpDXudacHUT9z4jsnGFZGgM4AvX4RgXY3A+OH
	t13BZix/atS8QlJpGCcJLMP4dLHL/yRKSBgh5K8WZDJu2mkLNj3e2EibfEWDQUdRWBTqRL1oJA5
	HbPVzHgIlRposeRK+hwC4hZkFiqwvQE9VCub/qjazx3dz3M785b0MLkLImS0lTXkfV29ZGM548U
	tX14mijtF/zItM2Np7Q+FLgSdHIlzZdUSdv6C3/KLynZWknY+BY0QGjRPmreHo+wHsuaYFQAQQ4
	GpI
X-Received: by 2002:a05:6a00:92a6:b0:824:4a22:ec02 with SMTP id d2e1a72fcca58-824b3042b8bmr1089776b3a.42.1770874091996;
        Wed, 11 Feb 2026 21:28:11 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e368d0asm4119668b3a.11.2026.02.11.21.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 21:28:11 -0800 (PST)
Message-ID: <532078ce-f02e-424f-8382-2b52438a657a@gmail.com>
Date: Thu, 12 Feb 2026 13:28:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew@lunn.ch>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
 <20260210052226.3005666-4-a0987203069@gmail.com>
 <aYsurPBMnzWDZCco@shell.armlinux.org.uk>
 <747b9ab4-6711-426d-95a5-4ce6c8732edd@gmail.com>
 <aYxYRZZkVFz2jHaF@shell.armlinux.org.uk>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <aYxYRZZkVFz2jHaF@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_212813_422076_B9A53F92 
X-CRM114-Status: UNSURE (   8.20  )
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


On 2/11/2026 6:21 PM, Russell King (Oracle) wrote:
> On Wed, Feb 11, 2026 at 05:52:21PM +0800, Joey Lu wrote:
>>> Is this register preserved over suspend/resume ?
>> It is not preserved by the GMAC suspend/resume flow and therefore needs to
>> be treated as a system register rather than a GMAC local context.
> That is another reason to use .set_phy_intf_sel as that will be called
> just before GMAC soft-reset in the .ndo_open() and resume paths.
Got it! Thank you for clarifying.

