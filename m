Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2006D13C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 15:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oehPzj1NcxPq0b6ZJi4vCnPjGp40ojSxR9AeiNKzfv0=; b=jZbq0KBQeDleZqoJoht6ze22h1
	udQ36x3KhrdVktI1XqF2AiqlUMxwtsOVe015JhqMaMP6gBs6iN7zVz71XhdQxXnLiPNyfBDgSIfKQ
	6A6Ih+nW7GX6TmGcTnmex1VBdwhM56PzmkSGeCmLo2N7FRWUgpUUWAvD7p6R4ho569kyMHHJQcbRK
	J4JoqoeF09/FKSLAT11bPK3yxzC8XXuT+tJ4/aHCOpQodb8D4bkWjnHhCc000c7JD8v5aFitNfTzW
	Ed++VtRgLZrm7tuThvOsglDO1nD4x7ok2TD1tQd8Sr4a8qqzx3nQWdgadoFHqivet+6PtstZYmD7Z
	OlhKwhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOQa-0000000ClgC-1hXG;
	Mon, 26 Jan 2026 15:22:56 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOQY-0000000ClfW-0Hes
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 15:22:55 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43590777e22so2782139f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769440972; x=1770045772; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oehPzj1NcxPq0b6ZJi4vCnPjGp40ojSxR9AeiNKzfv0=;
        b=BRcsIbp/goTk15HERTNHNYYHzYcsiO5H4WMu3gbenWqcLOZV+tmYaxXU6gKSyv973U
         zyQtMMmB7WC/fSrRungaynJKTVfy/kK4s1gQOr8DPzk0NHCAFWcn1sQANlLsa0lSYC3M
         Tk67bD0WSrvc6eNJ12F4Dz8YX1QvA21ECfG38SRbtbL72k2KGzcVF6Nl9Cjxezzoxy5+
         u3nnuy4l8f1aHavnAQcBnD2lPzVWq8LsrKJ7IJ1POj+9vffGv44NPcnUXM5NF0EQ5C1W
         a76jAFRp4u93j9n2gi50kIVYA09WbAFk3hcLhfqsQ1MKRcGPtVnof7AdK+n94CIEq8oa
         te/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769440972; x=1770045772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oehPzj1NcxPq0b6ZJi4vCnPjGp40ojSxR9AeiNKzfv0=;
        b=QzHojjaMRU951772NoDvwBrxy28j6PcheAus72LxsWHWPm9Nd3gommzc4DtiM3eWz0
         Xd1kpmYumg/9ApnQzB7tN2hBsrRnRjZkVboCvRa4tFoLz5W1Fhe3IuTbG7OxEO45Tw4d
         hogIPKQxFgkhFa1eHEN+jcyn7hhPuySmqqR4N7JXWRzZTPrc+PgCgbFdaBlnivDkHZUL
         Cq/bkHufMBbtW4jtH25+fCXtHOxZd7VOf5f/B+s48RdTSueCgrahwFvBRjo1lvDfZ4ay
         ATp890JpHOnrYysSiql2pmCpas8ewlAZG3XohQC7or5Osi+isJHrlbR6LTMD4yhrrBav
         uV4g==
X-Forwarded-Encrypted: i=1; AJvYcCV8dmMn5AddT1jXWqH8iDSONh/MyXdgyWU802p0gIVnAvmw2PbIuY94Q3Q4J8gmngkYzHfnNo3esVrpRMtyBuIq@lists.infradead.org
X-Gm-Message-State: AOJu0YzWPltlec5ya7e7WYhZG8oerQb3P9rxfXPzCcbnhDtg8Kgs6ay2
	NAxX7kJrTxEImPd7x+5cvzekaWoPXxfKZ+tUzk3tnddDnYZTfo/JRFEd
X-Gm-Gg: AZuq6aLU2lH2817O/C4Ffot4rV8KCwQ1lwRyvRi0EHoxLi5L3mHzJUa3WoX9xIGcFmw
	QnVw8B53dl6jA3sIOtiKc20vXkHlju6U4ZhPboe9WauXbHtEfrJr+d+apHQkzUTW/EK05KRw4+F
	2oLHuIEjiKGRjSgihLwZ2O2hD59eXxn0WPPNk8K/6Z4ylW/gEfIS6n46iPwxkJUuNPPEfC9gMu5
	nJYapRBC88iZhNdUMCOngrF7Twtzckpd2RoqgsoSuZG4fno9p1dKDwIT58k9WkaX0NytYE5X5oH
	qOSjMfwGSBXr6VLUCZUjqUhKicE6LltqzP1EcB/pL0vG+1Db3FSMRER5lMOA87ZfSwAxLuaSMUv
	SK8gf4UChNjPPBUiYNRh5RQ2A7NFXdwGQljpdeTTZlbDay80lTE/krM5pDVt+/hp+nyhtIpVAXB
	CITAUbIAxqI/XXpk0Uo/5HzJB+Sa545EZ1Z+NiRWCzZmM=
X-Received: by 2002:a05:6000:2912:b0:430:f742:fbc7 with SMTP id ffacd0b85a97d-435ca0ecea4mr7122413f8f.14.1769440972075;
        Mon, 26 Jan 2026 07:22:52 -0800 (PST)
Received: from [10.25.211.45] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a6fsm31149882f8f.16.2026.01.26.07.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:22:51 -0800 (PST)
Message-ID: <b7c2a2b8-000e-4bf8-89cf-19e4e21e78a7@gmail.com>
Date: Mon, 26 Jan 2026 07:22:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: imx-aipstz: set default value for opacr registers
To: Shengjiu Wang <shengjiu.wang@nxp.com>, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 laurentiu.mihalcea@nxp.com, daniel.baluta@nxp.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com
References: <20260126091156.951052-1-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260126091156.951052-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_072254_120035_BA307347 
X-CRM114-Status: GOOD (  11.78  )
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


On 1/26/2026 1:11 AM, Shengjiu Wang wrote:
> The sdma script app_2_mcu needs the permission to access the peripheral
> devices:
>
> 1) SDMA2 transactions are set to user-mode in this particular case.
> 2) This type of script doesn't use the peripheral interface (connected
> directly to SPBA), but it uses the peripheral DMA interface, then the
> SDMA2-issued transactions are subjected to AIPSTZ5's security-related
> checks.
>
> So need to clear the Supervisor Protect bit of SPBA2, otherwise the sdma
> script can't work. As the imx-aipstz is a common driver for all aips bus,
> so set default value (zero) for all opacr registers.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>


Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>


