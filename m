Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE0FC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDW6+B1/6deHWJRz59EqQ3HrDNwA7V1iNa634fXxC5I=; b=R5WIrl9YO0SDkbcjq8hrvWpXQs
	GY0beF2PI0q59xVjBsHH6lvBHlh6cbwMX7ExKJSPhKEYOqLk1h81oW29jOiRMHlLlbnpLS2mcyOgg
	nTQcgrfdDxhm7BhfqWSMXjJSwgtIeDgzDFH/UnPRMBCrBNT3QfSNY9ZvF6bJjkI/DCPZxrFKXUwnx
	IoJ3wE8dNl6ExUfxWo9D90z4W6d0xDdwrD9WZPNtdHi/MopwS0QUep3U4eeRy0U1ehQl47uHWU1rY
	fWhrYF/weKL7wdyijxX3tI877tpa59sWi0c56JGigp0kexVUekuPkTvZ0uJ25mD/ye1npB9D3XNo6
	9ATKdD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0Md-00000006X2c-2iAK;
	Mon, 17 Aug 2026 16:39:07 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0Mb-00000006X2E-18iG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 16:39:06 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so3818657a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 09:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786984744; x=1787589544; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sDW6+B1/6deHWJRz59EqQ3HrDNwA7V1iNa634fXxC5I=;
        b=vU1JwXUyk5Nq45fBoqdHjsOu2346+igWWR6qvo0lQGuBoGU6BnN1BTKIEmxcvHZe2q
         DeSEWfSI6g7A1FOqkkBqJn9jMZSLB+WmRs7Yck/yB85vt/WdD/w88Q2W5rtUSvPPX56h
         SuICloEQ0u4E6GvKh8Q8u2ZtSL1IBl3Rft95YAtG/C5JSXd4GnuKh0shFP9OTHTKGfBV
         fkW4r+IU13b3VJB1GamtUltjGF8A0PTQ9o91LFos/UcdRsvLtYHS9J4Lp3SizITPS/ZH
         04E9HHsiItp5nNW6Io/jG4e7jLxtD2p25YjMd9TY9WMxgfX3hI6UGi2F8BRWy3fDqJzL
         DgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786984744; x=1787589544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sDW6+B1/6deHWJRz59EqQ3HrDNwA7V1iNa634fXxC5I=;
        b=nVj4AQwnNzo2RSV9MKkserxUEQPdpbTk0HtyBVX9W0NKbxrim9cTlEFrSLeOvjxgxZ
         ivMDMqU68QAvzbDWWbx7nVBlwGSbMDfHVDnNFYcBuz46FC5xkLhdMHvGa/99XL+5EJhL
         zEVWkx8uOSrB6QPlASLP6hqVOl0elEowYPerE0kHkbBkE9yDDZAMqR2z7/ycshwwNZsT
         FL7jqBgfgRmP6YNeJZFjJVkv6dSzD6LFtoJArD9aGKw6QUtYuDvVgRFVlVoAAjsrmBcR
         CXn+JXDjAGnb2Uv4P1CiHnDOaSLzINEC5Gjs5+DA+RJlWhFkQDLlmSEiztT0Y2W5fL+3
         3QuA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6e20uuLXf6NT2iuLTx3w7Wc3ObE01cCGlfWdtXB1ZXFlXbjybX+38u5ScEaP5IUgaR4vnJHHG1RzAdWNp5UKd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdxd1JJd14DigXdorCNHZEFyDaji9XN4XV7/YKzG5SDYiNHZfc
	LvXd4IEmAB/DkoVp1JVBTYddik+ZrKZrW9vrZlGL8rztGMwx1u0U/TbP08OxmWTEzEA=
X-Gm-Gg: AR+sD10dse7eBMhEyiMlf/YPtakZGrNwNN/KXEDp9YWbeaAvZ7VjX2PtsYGZwF7FEvl
	BZNB1+Tz0fN0+LL6o7WL7kAm5Ae2r8HOzjv6+bfZd2pYPUBRIs6S8yJx+Mrr+QpnWx2cXLOQFip
	ZWePHe0q7re2Omn9MyriNuh6O1R8vlx/wotN7wLiWHZd74Ihwo2DY49u/IKd6Hp8NSCWWmQQeUy
	8Ucz105+tPTFyDDyFOZtfaIio620wGltg+oXxJIat+j/8P+qxJ93YDG+R7dsQRYY7aYDWYk/eI4
	VApLdvZUL0mP9VofvWrt/vK5ofObQ6+PGevqiHJqJtyWMKbugjyXF0DJzHXsR/lmqxFSHcG5xgF
	Q3QFnwK/1xrLX2gSx4rzEgv3bwgUBHPTjCNMY8UvUEsaQW0MhfgGekO+ti6GFqvVHCtupYzRf+b
	700l+jWnQgTeFxk97txcIzmpoZLvB0NwTjgNN2zPVTWIU8rnbUi+kJ7h7UkaTf0Gmk
X-Received: by 2002:a17:90b:2e4c:b0:390:b41a:b92a with SMTP id 98e67ed59e1d1-3933bd0d632mr29846740a91.4.1786984743634;
        Mon, 17 Aug 2026 09:39:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4474:5926:fe69:196a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b3b91sm3029317a91.13.2026.08.17.09.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:39:03 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:39:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Jiafei Pan <jiafei.pan@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	"andersson@kernel.org" <andersson@kernel.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Z.Q. Hou" <zhiqiang.hou@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
Subject: Re: [EXT] Re: [PATCH v4 1/4] dt-bindings: remoteproc: add
 imx-rproc-psci
Message-ID: <aoM5JKcbc4AxoyO_@p14s>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260812104633.22420-1-Jiafei.Pan@nxp.com>
 <20260812104633.22420-2-Jiafei.Pan@nxp.com>
 <20260813-imposing-blazing-gharial-fbb19c@quoll>
 <80dfac6e-3408-4f62-887d-9da39c827dd5@kernel.org>
 <MRWPR04MB12277AD3869C2AA396ED9A5BA8ADA2@MRWPR04MB12277.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MRWPR04MB12277AD3869C2AA396ED9A5BA8ADA2@MRWPR04MB12277.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_093905_335693_890D3D14 
X-CRM114-Status: GOOD (  19.95  )
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

On Fri, Aug 14, 2026 at 07:37:36AM +0000, Jiafei Pan wrote:
> 
> NXP Confidential
> > On 13/08/2026 09:49, Krzysztof Kozlowski wrote:
> > > On Wed, Aug 12, 2026 at 06:46:30PM +0800, Jiafei Pan wrote:
> > >> +
> > >> +description:
> > >> +  NXP i.MX SoCs integrate multiple Cortex-A cores. On certain i.MX
> > >> +  platforms, one or more of these cores can be offloaded to run RTOS
> > >> +  or bare-metal firmware as a remote processor, while the remaining
> > >> +  cores run Linux. The cores are powered on and off via PSCI (Power
> > >> +  State Coordination Interface) CPU_ON/CPU_OFF calls to the firmware.
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    items:
> > >> +      - enum:
> > >> +          - fsl,imx93-ca55-rproc
> > >> +      - const: fsl,imx-rproc-psci
> > >
> > > Hm? So you just ignored the feedback?
> > >
> >
> >
> > Ah, you just did not bother even to wait for my reply!
> >
> > After three months after my review, you send reply to my comments and
> > IMMEDIATELY you send v4 without waiting for me to address them.
> >
> > Srsly, if you have three months, then don't you think I deserve more than 1 hour?
> >
> > NAK
> >
> > Best regards,
> > Krzysztof:
> 
> 
> Hi Mathieu,

You probably meant "Krzysztof".

> 
> I sincerely apologize for the poor timing. I was not familiar with the upstream contribution workflow — I did not realize I should wait for you to respond to my replies before sending a new version. I sent v4 immediately after replying to your comments out of ignorance, not disrespect.
> 
> You are absolutely right, and I should have given you adequate time to review my responses. I will make sure this does not happen again.
> 
> I will wait for your feedback before sending any further versions.
> 
> Thank you for your patience.
> 
> Best regards, Jiafei
> 

