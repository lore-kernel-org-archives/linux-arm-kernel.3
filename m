Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C416CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3u94YRT79spApvgUHXqpHk7VkZP3TakIQrwY/BB6dM=; b=CdtRqDbUUs1Uiw/PjVCXOuWrS+
	ntSyJXxJGXDAMJjlXe5ZZukzB873QJ6KDocWL8AwrkenpjSQdFDmwe8c20q8ksKQW2ukB5PxU7szJ
	lAZsscNq0flHL/ecgbOs94xPKM8CHh3JTyo2KBGJZ1SgSoqQLwc4N/Hfurz9KUrw/4g5FsvyilBS1
	YB/cSaqKo3UJUAIRGG/ANYqhlhKdByZTM/gg4wfok3WfEVBj3oIgwGw/P7sCn6dpOoOeVs99jta3D
	u44pR+xg5VTB2nBxv+lb5Tbq5FdkZvf7VEgqL4LgShU0lMJiem+/K2CwcUEuqigeaW8TzDcD+5Hy3
	f7e7lelA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnbV-0000000FQej-3lgB;
	Wed, 03 Jun 2026 15:34:01 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnbT-0000000FQe4-1Ur9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:34:00 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-beb8a08a6c8so653784266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 08:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780500837; cv=none;
        d=google.com; s=arc-20240605;
        b=X8dBW38124K+T01DX4rddnG7JrO72VTDwjHcy8An9PQuNZ0RzESOffY1su8836SH7O
         kXMe00OzzH2+Na2bvR14H2aZgHf6fNDp/su7KAcCixSWlcWRDZyK+sJ1KKxTbDZS+R34
         IKx3Qk1osAk7O+hSOygPf0eyb4rBJQAqc2imso7whL2D2BzclxqsXO6XcGcE5P1umsRh
         7k46SPKfRDDAYcwyZaZDoM9CX5scHcJ3WRgGJ/7KnhxduzC2AlcxNaneWteIcOMtbD55
         xd3jQCSimgY5Nk5DvT0qj7AjT1gCrl35ayT5SvQPXwp8TAYU9JNFTbfxs3jXaXgU2AgS
         tw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o3u94YRT79spApvgUHXqpHk7VkZP3TakIQrwY/BB6dM=;
        fh=GWRs4un+rl9kHcAKaaRM+Taps/S6+EJaWqZ8zXecwZ0=;
        b=N6O6iZgEEXrJNhn+lmY+b685ATxnsh8eqVAo9UogHIMj3L7JpxKaqoLokcgPj5y6Bm
         rW80Q+BIs/TYBu/u1utQN93UtpyH6Lyv1Sx93Rq1uph1YGr/Rd/V9DKUb985DmzP3pQ6
         +wr7L4hdjDO7/2LKWizmVxTuteRg9/ZxUYp8UtR3drKMu2Up5+yLs55sWYjMJ/X8EvoU
         lyo5vnucsjCghqREZauJTPfJBQo6yt/hzZoXuNRhRU9+knGn32+vOJDdw31HBHHWjAbE
         F3zNw3MLBQMAHGOAMALWodZwb6VNg5fHBF6c4BvWLMtt/1c0pjMWxCuE+a3y00pW0Uky
         NfvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780500837; x=1781105637; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o3u94YRT79spApvgUHXqpHk7VkZP3TakIQrwY/BB6dM=;
        b=eEErWyN/DesJFA45kYesyjubebPJlcVwvoxSJ7l3cbeva9oy1YiSo2amrP7k7gLrTM
         4IozaFz+KHnzQXSNiHjZApdi1/dZhG/U2RW79kCH7XPWHoA66yE1IKa3Z/3p0BRxX/ch
         9MxsNnGMx8pHNoallZalpRWksOmLHY3iw1HtdT2v1EUQTSJect2X+8YcmbIgb/lGCvIn
         fdmOlBmb2v3Fc2yG2vazSDfN7DNE52QfF1AXXa6Y/Pnxvy00HpP8013t3syEuaOZr0HK
         vThsnzf0VvMZoMyRUvSbAmS+QMgQjdOfbS7LwiyyszIVBJiOCF3Re6RARqtaSTL5r1Ea
         4kKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500837; x=1781105637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3u94YRT79spApvgUHXqpHk7VkZP3TakIQrwY/BB6dM=;
        b=bXERiBG3Nk9xr6TzlQPQiHyS9NBuab4xpV91R++/ESSTdAVGDsfxrYmD85PDkAIGkY
         LIUQJb8m9+16U2iPpQ3Cgsi4u6thpFSdxD6F7cAZ+zT6k5a+DopsTVasKmM9VoOrlB5V
         bTYwFMgYnzQVcq+J0v40IXWTTcUySwfzWMxlC+CnE9gCrtEm2CNkFQOWwtl7vtR6d6T8
         p4joD3oCu5zCQa5hvuyTQlwBGNeUdlJWUpTPIj/eX+iBRETh1e+Up6Ziih4QpJY8ggyz
         Bqfj9Yb/dMGApllq2lb8MBnIoEajZWgFrRGfhoCB5FCGNMrK3sl1WR+hjQLSjd7vlfyO
         OaJg==
X-Forwarded-Encrypted: i=1; AFNElJ8qVkVori0jZ5ODhyppIPuNSfLkDvz7vuCEQAX9jxPGB/ob1kDVuijh+wuokPROBAE302NhI8xeHSXBuTR3RQ0o@lists.infradead.org
X-Gm-Message-State: AOJu0YzYEimfRjkfSoSfq8IPiJX3BIEVRmtNN5syp/87T2a/bKg7i+yo
	OMQPU7qMaXCPLwN99HJzLncV32QZnWEkBiWDCWmjk+3c5ooD2t3AfZWYfU+HoxF1rdWZBybW/YB
	6UhjZp6XCZ0H1FK9Fg6eTmQnfjRaUF/g=
X-Gm-Gg: Acq92OGNGEDKw+8L5pX8bmg5CNWmvRQHQsnSpJQgJK/fIAnb68Kpec1H6noXErDVxVr
	MzE17sNDZyGjB+aQkZ8dDl7lpB1yCQ9pExoxJXkdB+/3HR7GGf4l5++E9iw3ZtmHDvbgymw2++i
	IRFnGKiGPOtVrSmRuCM7BLN/z0HF6ab4pPjly8nn6b7eR5a9Pka17gJxD1yjGd0QlCYO2sxLj9L
	WaYXCDaWd9qxa+8Bi3IyWTedUOPYrlIUyi5R0rk8AmkQCaP2Jk4EoDEGXex4bV1krA0q10gr8bV
	ez7tpgRiRH7DAAYBtQ==
X-Received: by 2002:a17:907:a0cd:b0:be1:d908:ce23 with SMTP id
 a640c23a62f3a-bf0b16de416mr232251766b.21.1780500837224; Wed, 03 Jun 2026
 08:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260513205720.638900-1-dbgh9129@gmail.com> <CACrCO_WA27igaDzS5N_Vi3oxjSe3dvv8iLG3OLS_ZJ+NxTw4YQ@mail.gmail.com>
 <b6764a7b-d288-486a-9feb-a7c6fa41d777@lunn.ch>
In-Reply-To: <b6764a7b-d288-486a-9feb-a7c6fa41d777@lunn.ch>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Wed, 3 Jun 2026 11:33:45 -0400
X-Gm-Features: AVHnY4KM7cw6SJVC5MKwhOGWFT_o-MulmFwsY7kI7KBdKjPXnlOoEtlDgOnngcA
Message-ID: <CACrCO_XxCa6CWm1ucfnK2TxBvMxGkRdDrkXsfT1GB03dd4TMxA@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: devtree: Fix /cpus node reference leak
To: Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_083359_410756_47D1E606 
X-CRM114-Status: GOOD (  14.03  )
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

Dear Andrew

On Tue, 2 Jun 2026 at 23:09, Andrew Lunn <andrew@lunn.ch> wrote:
>
> But please think about what you are fixing. Is it theoretical? Is it
> old code which has been running perfectly well for 10 years? Is it
> something really early in the boot that if it fails, the machine is
> dead anyway, so who cares about a minor resource leak?
>
> Are these patches actual worth while?

That's a fair point.

I am still relatively new to Linux kernel development, and I think I
focused too much on correctness itself without giving enough thought
to the practical impact of the issue.

I appreciate your feedback. I'll try to consider the mentioned points
when evaluating future patches.

Best regards,
Yuho

