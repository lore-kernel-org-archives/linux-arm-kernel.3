Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF39D3943C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syQhn3FKDSt7aahom2Cd5r2lVp93DM2NQ4SMHj+9K0s=; b=kuC1+6VVGGHe3dL5Zs5oYJdtiV
	v1sBptIrno6t+WeLgfREpsRm335Emac7ieBp8BtgjPH5gyn0S4038Q6e/vaYJt0YkvgUsIjZtXWaN
	gXNYAq1pbp+oOXn+m/PneXMu7EbT8Njm3DUo6QJiHr3+VWO01cSiYalhcz1/dyB/ZCNjSZ/wcoDK8
	2ZLxVCYN43Nn1edzxwXnwBqOhyjOgMW1W7iyxDe1Ow1Ja3YNazDGY/oWuIdcPfnlhVT59fNLEYLOT
	HpwbAgwEzfzMA02gobDtq8Akgj9XWW9k8LTQn7x53nnQdyX1P/OZZYolyUlUYqTMf+BHF3cA7I0mJ
	+HCGnndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JKW-00000000N5M-00KY;
	Thu, 02 Apr 2026 14:47:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JKT-00000000N4z-1vhY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:47:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so8931775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775141246; x=1775746046; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=syQhn3FKDSt7aahom2Cd5r2lVp93DM2NQ4SMHj+9K0s=;
        b=EZL++3T4xebsucUd7+wrzgIy20211QYoJbD630WpNCmoehXu9m/nlYn1iE3U+bz1lN
         KxJXb8cPpEq+jajuX7/C/kT+e9170zApmCFOaMRcA6WHoXbn4Qr9+3iJTLgXA+RoWZKR
         jGm2jdDfYks92P2pcVEy9Ct18YX6N2LA8pUB0sL49IBVgORX62cAAEhhqV5HMAtH39M1
         MAnxfl31dKJ0dviA0ltJZ8M4EzltH+IXnWY4LDDbVEvZEN5NSkTFQ+MdUo9mF9dBBEa/
         ywDuvznrDWARCHzWQp/8OxknSkKa0SAGiJFNuaLIWd1ruAzzMx5FTvsZgN+Yphaxpp9K
         Ly7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141246; x=1775746046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syQhn3FKDSt7aahom2Cd5r2lVp93DM2NQ4SMHj+9K0s=;
        b=oqhpdgJl0dRmzRPL/ChAW2YrhbpwiDFDbkCmfZJ3YF9a7OEebSfmZERSsWcF3BuhW8
         0hAXCvLyLk8NDnhTNCoLZpgwV26nYV6GaAOW32xX3FTKC9c+t5Bico7kTLw/RA5mBDQq
         nS7V7ZqfA7WynLIfXJW3GHOKqto/nU+CWLIRNNNi5ahvLO85NiSCMZi5MqaaZG1CJzKw
         1zNOuvZSvkz+qPbg75/Hom0f8INlGML8KCwk/D02YF4f2d7K0HWUHJmE3kPZq7X6DJ9b
         L6demB/08AVs46H6qNbx3PJZDOBAANeMwP+Go2tRuoajN3msWIfEpcLeaXP/aZURaPEM
         MXmA==
X-Forwarded-Encrypted: i=1; AJvYcCX9utEFtKf3WO8WPBQAJLYgvigLzStt4X72ji9pQk4Z4B4iezKh6u93795ebqumLM0Rrmp23aoFiVNFm+FLHV9e@lists.infradead.org
X-Gm-Message-State: AOJu0YxnZqYNQfaGWg3ahOay4woEFpp/yY5WsXZj9un52iCUkeRrIEWP
	eUbIoECpLKXrftxIBxH0ckxB8VW4m9hkoxpnaY4BNTJyNL3ELmTFiqBy
X-Gm-Gg: ATEYQzysVtpVBxyiEfnqPF6c8X/5926z/1uQnVeyao5OMs/zjny+vphJzQjQXv15aLD
	IBeztLqBtTf8gYkV9LZjK4rR88xmwjgDH2iZbd2SQCpt3B1FGxIbWpEkRhxGmlfaLHDX5lASxDZ
	6pK0eZJjaO5dqRU7OgpvsAj5wpriyCm0f36RZG+Z6dmijKq/6LXnAtkqxvTcMsr+yjtgFD3+23/
	JcFfLKDLfZdOJEYjUycTxGHLSC3Bhst1hrGPnSUAdcXYLF+jxiNqgPe46v/onJNV0pDX+YcSNaG
	5JcW3tdU7eFhcDcDAe56IrMkKTHpltJsWgYB1lZwIA1rpqEFwZX4MdocdWfSSGskqBMwbKqY5Q8
	lhCW5UNZz1N0hvuuadZOUd0Fd5wRI0NpaeVZgNrlnRKWHCzT81oju+6FpkAtvVAmzhv6Yyi2/9s
	CqkqP0t4OaWcJkk9JbxsYnd5omb/56+EOBdpJ1/2ZCzI9+OAG/pUqgC4mjXw==
X-Received: by 2002:a05:600c:4f08:b0:487:1826:d89b with SMTP id 5b1f17b1804b1-4888b6f7f8emr56182235e9.9.1775141245586;
        Thu, 02 Apr 2026 07:47:25 -0700 (PDT)
Received: from [10.128.11.51] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad8d28bsm87489185e9.10.2026.04.02.07.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 07:47:25 -0700 (PDT)
Message-ID: <cec5001d-7ac7-4b21-a3d6-6052e1d8fc87@gmail.com>
Date: Thu, 2 Apr 2026 15:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] stmmac: cleanup dead dependencies on STMMAC_PLATFORM and
 STMMAC_ETH in Kconfig
To: Jakub Kicinski <kuba@kernel.org>
Cc: manabian@gmail.com, davem@davemloft.net, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260331125817.117091-1-julianbraha@gmail.com>
 <20260401185814.45dfc444@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260401185814.45dfc444@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_074729_512862_800B9026 
X-CRM114-Status: UNSURE (   5.45  )
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

Whoops! You're right, good catch. Looks like I've been staring at too
many 'depends on' lately...

I'll send out a v2 - thanks for reviewing Jakub!

