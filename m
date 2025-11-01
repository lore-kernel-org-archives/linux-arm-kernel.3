Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACB0CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 03:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6DxzGsF0ReGwbytjfaFauugox95ZUf7zrl7UO1KLmU=; b=FxxZGJgrHCsQqiTiCLsVWNbmGr
	safxnspIy58fL13KrwJKlkpbiIpPGBzysChQesHHTk0W+vKuIomHj+sQEdem/rUnqWVT9uI6IsPx5
	jgm40TXOh4V7FwKJoSFvVflZcNjevXD60uHCXoBeAnHrmVEMcvHIps5rSStytECN3J2Nm9b3AGA0A
	Ii9yrfsXIVeT6yj2svYyQuk9++DxkmFQc1n0DVL49yFjC7gyT+rCjLzCL6NCsuU/2HneiGqGwO4fx
	4uUH9ZdcZNPtO4NhiHHqD2hQp0xcMYv3EclXmY+Q0DTlawlJL+FZevQYSKN+2q6WodRTe0odd9ipe
	3cHt1QLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF2V9-000000072C9-188D;
	Sat, 01 Nov 2025 03:42:03 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF2V6-000000072Bm-22ly
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 03:42:01 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3402942e79cso3925403a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761968519; x=1762573319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6DxzGsF0ReGwbytjfaFauugox95ZUf7zrl7UO1KLmU=;
        b=h+jaoIzp6NU31zxKcfCEhnPSY38hbMGwPXFPr/likCC1bOl41UmgqzMdCPK4rtHdGL
         fp0Qkxizn2zUwHWEEFtlEpAosNbPlSMcZuYka4zC5WtEq6dF9EVBCJ1LVt1SdxqcCR0d
         AjiT25w2z1eW0FqoEA0FzfLQqZ0WbsnyJG3HVf1K8qPmcPdhjpBt8+63z4e2WD7/39SK
         ZW+lhnzi2Yp7ilobmjty0MUWxhfOZr0LsHIToHDQBVYRLcmoziYlRYRvmUrQU0IQLGG7
         AR1rKXAbBPEtFVRnSsd5WyVcezYUpqe3NctR8qq7wbJc+9B4Nzu0oQ7L6NIbq0aHkSuc
         ja4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761968519; x=1762573319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6DxzGsF0ReGwbytjfaFauugox95ZUf7zrl7UO1KLmU=;
        b=IWx2t1fIypeiT+r9PqS4EJ1rDQH0wy1xqIURDZaR/ek4jLBlPbdtrY0Z8I9jnieKV0
         BevJ8H4Zi3hQNDwjlJhR3+umb1IiJncGfWE6FVI8zyEdXs2fPcFpaaIV4vhcDnzWilNU
         rHj+ZjEqcdisGI7edRhiicaFATIJxWmjJWfDxt4OtcCaZBTOqa5ha7JxBNW41z9fWr9P
         qY4oC0wGEZibRsICDTe7llVSMrUz3qwzLjdg96+uH2nM0xUWvyRfodGccWV7EFfeUMIl
         YP/Oc23V/sRJvrCdaNx+oLZcE/82oJbPumFnNioi+NIDWFxVckFV0Zq9kmGnaN19tcxU
         j5vg==
X-Forwarded-Encrypted: i=1; AJvYcCXHzJSx/yi6UNd1Ny3sqHHgdpJyI9rgCDjD5AEIHXIP74+bZHsYaKh1hF9DitpyARewaq+jb7xECCOtY7Y6KGvL@lists.infradead.org
X-Gm-Message-State: AOJu0YxrDdEs16YJ96y3z6j2dzuwEpg7s72v1CK+j4dNNIJHMvLS2Agm
	HM3lGKxxlRTUmVb2eLLCxbrmDbOkiDhS1fX8FPxhEXUd2Spg02tQoj6a
X-Gm-Gg: ASbGnctsDOf7Lr7O/6CQ4T/hqaUtZyRIB0V5lZYaIarFjoeCk8AUthEJuO/8YCspWeh
	VaKHE/yRO55/b3T5vsBqqpUTNUejigj7JfBJ8fCn2xgcg8qGNkGYIIB5/nyVpTe2QVyNfRsLWbN
	gLGKrAE5F5TVVEiTAel6EATboSijPxj4nqrME9LTNddz+nj4+qi0lpzS8UHJ4ZdsZj316TSjy3o
	vmZMwPblMK58cLCuyZ69a92DvyKMrSbe8/Z8yRzfr0pdoYPP42wvZnm+FGyrTw5of/9p5EmGsRb
	cUDKQNDnWc2M2e9oNdw0BlL8Cg+a2ITZGHzlNdVaAY01+igujjvT79LY5wrVKdq385Y8YpS0BAm
	BIREjib4QGJ6q2s2v5spEAKsmC0OAq2IXvBGn51tw56xGTZCBWEgG4yWModP1OEo6tSmolh3PYZ
	z6gy0vwTmCpSvT6QBiYhgCti3YYA2iOyA=
X-Google-Smtp-Source: AGHT+IFTKC+45FAGjBsfJbS2jWqy7zIBFJxN0wNU7A4TaUwJWYWu38/fpztwMnb4h9wTzf56Tf+jgw==
X-Received: by 2002:a17:90b:1d47:b0:31e:cc6b:320f with SMTP id 98e67ed59e1d1-34082fc4ebamr6861404a91.5.1761968519146;
        Fri, 31 Oct 2025 20:41:59 -0700 (PDT)
Received: from localhost.localdomain ([124.156.216.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340bae47beasm652975a91.3.2025.10.31.20.41.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Oct 2025 20:41:58 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: bagasdotme@gmail.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	alexs@kernel.org,
	arnd@arndb.de,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	david@redhat.com,
	dzm91@hust.edu.cn,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	rppt@kernel.org,
	si.yanteng@linux.dev,
	surenb@google.com,
	vbabka@suse.cz,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH] Documentation: treewide: Replace marc.info links with lore
Date: Sat,  1 Nov 2025 11:41:44 +0800
Message-ID: <20251101034145.31515-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251031043358.23709-1-bagasdotme@gmail.com>
References: <20251031043358.23709-1-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_204200_535367_F47C5FCA 
X-CRM114-Status: GOOD (  16.04  )
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

From: Lance Yang <lance.yang@linux.dev>


On Fri, 31 Oct 2025 11:33:56 +0700, Bagas Sanjaya wrote:
> In the past, people would link to third-party mailing list archives
> (like marc.info) for any kernel-related discussions. Now that there
> is lore archive under kernel.org infrastructure, replace these marc
> links
> 
> Note that the only remaining marc link is "Re: Memory mapping on Cirrus
> EP9315" [1] since that thread is not available at lore [2].
> 
> [1]: https://marc.info/?l=linux-arm-kernel&m=110061245502000&w=2
> [2]: https://lore.kernel.org/linux-arm-kernel/?q=b%3A%22Re%3A+Memory+mapping+on+Cirrus+EP9315%22
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---

Thanks! Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

>  Documentation/driver-api/usb/writing_musb_glue_layer.rst | 2 +-
>  Documentation/mm/active_mm.rst                           | 2 +-
>  Documentation/translations/zh_CN/mm/active_mm.rst        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/driver-api/usb/writing_musb_glue_layer.rst b/Documentation/driver-api/usb/writing_musb_glue_layer.rst
> index 0bb96ecdf527b4..b748b9fb1965af 100644
> --- a/Documentation/driver-api/usb/writing_musb_glue_layer.rst
> +++ b/Documentation/driver-api/usb/writing_musb_glue_layer.rst
> @@ -709,7 +709,7 @@ Resources
>  
>  USB Home Page: https://www.usb.org
>  
> -linux-usb Mailing List Archives: https://marc.info/?l=linux-usb
> +linux-usb Mailing List Archives: https://lore.kernel.org/linux-usb
>  
>  USB On-the-Go Basics:
>  https://www.maximintegrated.com/app-notes/index.mvp/id/1822
> diff --git a/Documentation/mm/active_mm.rst b/Documentation/mm/active_mm.rst
> index d096fc091e2330..60d819d7d0435a 100644
> --- a/Documentation/mm/active_mm.rst
> +++ b/Documentation/mm/active_mm.rst
> @@ -92,4 +92,4 @@ helpers, which abstract this config option.
>   and register state is separate, the alpha PALcode joins the two, and you
>   need to switch both together).
>  
> - (From http://marc.info/?l=linux-kernel&m=93337278602211&w=2)
> + (From https://lore.kernel.org/lkml/Pine.LNX.4.10.9907301410280.752-100000@penguin.transmeta.com/)
> diff --git a/Documentation/translations/zh_CN/mm/active_mm.rst b/Documentation/translations/zh_CN/mm/active_mm.rst
> index b3352668c4c850..9496a0bb7d0705 100644
> --- a/Documentation/translations/zh_CN/mm/active_mm.rst
> +++ b/Documentation/translations/zh_CN/mm/active_mm.rst
> @@ -87,4 +87,4 @@ Active MM
>   最丑陋的之一--不像其他架构的MM和寄存器状态是分开的，alpha的PALcode将两者
>   连接起来，你需要同时切换两者）。
>  
> - (文档来源 http://marc.info/?l=linux-kernel&m=93337278602211&w=2)
> + (文档来源 https://lore.kernel.org/lkml/Pine.LNX.4.10.9907301410280.752-100000@penguin.transmeta.com/)
> 
> base-commit: e5e7ca66a7fc6b8073c30a048e1157b88d427980

