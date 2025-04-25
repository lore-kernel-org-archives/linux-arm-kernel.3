Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3781EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElIjdAp6Y4lmYtJ6XWCfaS1fwcVpaJWdZTEkWJEeiVM=; b=Ku3Pj8MEPRwB3mM7JG7CUk6Jxq
	PLZ9VRh+NWD3TQzbuUZE7iOdB6ShXpRr7+Jlxnz/xsk6SjNoT3totMtJpgApgvG7CmQCaFbHrD8/0
	Lm4EEsW9w2uNvIzjIVZtTZ5sJz7We2yfY2DYLbPYul2hfaPfJa5gHCFK45S0QyIjXuP1Ij2JVuG+n
	Z84FUDIBXbvNkFFnfjjPDO/siPgOR+vZaLzOo4/uSdlCipmP3DLc8PdyOkrzBkYiL1beZi7eLLjnF
	29/ik9fpvbf4hsxDWSK8n0TChgU+qy5P7Se+514ovpIIYfiyrD6DasdEhNmjLE28N62QSEm3tunqD
	P7WBPiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L1T-000000003Cj-480Z;
	Fri, 25 Apr 2025 15:31:27 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JMn-0000000HKr6-08S1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:45:22 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso4347191a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588719; x=1746193519; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElIjdAp6Y4lmYtJ6XWCfaS1fwcVpaJWdZTEkWJEeiVM=;
        b=a99jrmN9Wae81rmcwznlbFVUV6qij7O6LmDW6r8fsLlCVsDCkkV3DXVTpkDeZt0Odf
         V1IRR2BGisthA4KGfVDlQmnE5LgccgUqKLJ88+fZf66U8bPiMEplZmyAmwRJn35ZDSQa
         FEJNYCCn6wBgfX/dzCE2jA3Fv90eTUCE4+TKsiDzX1bpdm3QdZwGouNztd1rZDMUYV3W
         WeDH3EKoqi69LEPTp+YivW6orgRRL8GpoBKDboT4QEWb9E3LwGV89Kk1EPNpixMBZYF4
         TtUhnfeVbsXHnOQxoaIqpPlMvlqVGapIqs1N35fW54JMgoZrumJdmoElF87U5veaGf3F
         icyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588719; x=1746193519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElIjdAp6Y4lmYtJ6XWCfaS1fwcVpaJWdZTEkWJEeiVM=;
        b=EaGjUsfY9FLJ1rvcxF7wowxpQDp+vD8OoFeCo2vBw9k6sVlRJClZX6uNLKEWK3mT0L
         Yxgg2R3MIC0Hu5WUY4me0XOdRdVYJXE1Yd12fA8LsrOAcZDjOGJQX3hyHJdrNEwxIUNx
         8R9IkhVGFu167TE7Z9Ykjs0c2IRqD9WtAGeIm9PFKqnjFxlZnizPr8zbFJss55UJh8RM
         m9faF+s9UKGCqRbSfEPPs3DdVbyUPeWP/85EVtO7FCFVI1pg2cy26bLPIjVSqI1SBnOW
         CHPaMtM4kRaEqqiRLe/70ZN4j6B7JgsI+i9Z/G+ir0wy3cMspAvoGDOBcLOx/ZnXvwvF
         Q7oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW0eEGrwCg4dCOfikn7MmhW2P87n/pg/mZhDBeQ7fFcBGkcYT0X0dJsYhh7Zir0jab3kYXI23J0BCGh76o0q7s@lists.infradead.org
X-Gm-Message-State: AOJu0YyZXObZfKmJDKD2LJWgPl2LjbqgO9OCUeKlR2cvw/nkCBV1M3Ub
	i3HjxlWgualamP6w1UE7Wg0aCS751lGGkAjXD8DspTbN1F79is7yE3FhD7DU
X-Gm-Gg: ASbGnctUU2a2wt/C6Fsfuf0Xbb+8MLoPktuUtHAwgfCPlO1j63eeFzcT0mzd6X6DWpK
	rDh+jQhvFgioHz+3tToZ9JkUqT89PnD3CZ1lH0nOXLjkJHEqbCg3g4nq5wWvCfbu9At09XyXs5t
	DgOWeRI7fGI3ORVXB026UE1z8uxeH7d3kDlHys0YXtmRrcSsOZ+bzk52WNJfJ16Cn+xzU7yR76q
	pA/oGufTO/4CMmnjabEOAX7u9hyiCyyNMru0RvDxwkzsi8f82hjT6TCHtwHeuVlMFWu5JuqgAxz
	dV44CBOyEWI/h7yrhvJt57HZtuh5GQJSbNSVphn4chnWHckz9HozdNg=
X-Google-Smtp-Source: AGHT+IGNWxosw6tYKct4NcUyBZgI0Q/yEcMUb40Dma2Svsw8igWh4KZ3iIt+8W119rSVYItTMA9Veg==
X-Received: by 2002:a17:906:4795:b0:acb:6746:8754 with SMTP id a640c23a62f3a-ace7111ef01mr227275466b.27.1745588719048;
        Fri, 25 Apr 2025 06:45:19 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6e41cb08sm143849366b.19.2025.04.25.06.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:45:18 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:44:25 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx8qm: add ethernet aliases
Message-ID: <aAuRuVq92b1G0T7H@graute-macos>
References: <20250422100239.58799-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422100239.58799-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_064521_071231_7700CDE2 
X-CRM114-Status: UNSURE (   9.85  )
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

On 22/04/25, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add ethernet aliases, they are used by the firmware to set the MAC
> address and by systemd to rename network interfaces to predictable
> interface names, e.g. end0 and end1.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Oliver Graute <oliver.graute@kococonnector.com>

