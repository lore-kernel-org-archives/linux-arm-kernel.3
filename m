Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E20ECCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mW/HzZ3gW1VojRmfulxz/q3LPA7ybA89Muj9W/fDTPY=; b=o1trhqw7+f2GcBuw/lH6hoQsr3
	wrdw6iRpLbeoqk6NNONZOFDhZUpnZaZmYix/JEmGsTYKlB70WMaYX30ITHznFdt+t7ROCrJIS94ys
	FJvhkgsYc41rYopyhKY9QTSYjlAEpxZrlTu3H51gvwEhyCH+c6oqDWTnAyZ51BOvUL9vcW8xaR3Qw
	1XXfDhDmpux2JlLmlGa/VxVcJGkvxNgkZiphxTibGbOaOkRcNVHQ5l5L/Vb+LSZL7FLT/86d+dfqS
	RHm6u7bNWE4pc7hcujTN+8xcTCVw3NmC3GAJcnbwTqBcebPWDkuEjqZ9SDc2VUwN5AoPWGEHuVKZb
	qpdRuEbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfN-00000008UsE-1SQh;
	Fri, 17 Oct 2025 16:50:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfM-00000008Uri-3SVq
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mW/HzZ3gW1VojRmfulxz/q3LPA7ybA89Muj9W/fDTPY=; b=M7zEuabfzEhRd7hd1wgV9qBQ/C
	QVOQ2h6GS6hqLhZFW0uo4wxuaXqg2siwVvXtok8rqJ2b61wzL1MwFw/1myFp+WN5F8u1r12wUb9vM
	wtROgJQTqmeZWfsNtYegJiK8sIvODfrY9uUuYYCvPC+ke3kMhLUlB06moTfK3ztJAM86cQ2+0wrVe
	0dWvgQrdpa0bXuG4kAOZz6uXcI5wmyN+wWjDPSCWXnq2EW7YCvi0Q+z09EaX5HQA1mru3OILMsawP
	jN26fgHf4EJihPlKWppO7EOns5DmlGjzFoH4qbnIFjCeJI1UNe4r6Fi1gqYMmdDeMAOzSY2scplbk
	SjtAhquA==;
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfI-00000007mgj-3u2G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:50:54 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cp9n526C3z9sr6;
	Fri, 17 Oct 2025 18:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mW/HzZ3gW1VojRmfulxz/q3LPA7ybA89Muj9W/fDTPY=;
	b=p7BzawF8M8QCK6v4CTLnkyHlWvhCxa5QXUljUyQErxSPSp7PWc+zy+UDhxCegUcrku92l3
	vOKM2xepz5l8LPThpvffyZJEhwQgTUzu9Lr6VJNjiaayMZBMQNWAp/COPtjwNGK4VRK9o4
	glv1spDZqP15qe6XJXaSynjVn1OKskW1UmogBtG/DljndEGn1H5tGTkj18JCbVSjRKieDR
	0jd3u3gDiTc6Xpl0olBv90PSPAlfruVMgBd+qEbKOJusXCtWEcpRtXCcrBShjfi8aOIyX8
	qP4Dzm3OuPTqWeeJHmORAb1kOfdCEwCIuAfI4gp+E6GGXzu7a8HKOfDA1VjaWw==
Message-ID: <cbfb1076-6a23-4b93-9ac4-4401b5b4a0eb@mailbox.org>
Date: Fri, 17 Oct 2025 17:04:44 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 32/39] dt-bindings: display: bridge: Document i.MX95 LVDS
 display bridge binding
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-33-marek.vasut@mailbox.org>
 <aO1Q/RIoMPEpxpih@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1Q/RIoMPEpxpih@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 009385e66b48b358479
X-MBO-RS-META: 78us17p5xfqwgitsrb49mw8bgn1heybj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_175053_058018_A4DE6DED 
X-CRM114-Status: UNSURE (   7.86  )
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

On 10/13/25 9:20 PM, Frank Li wrote:

Hello Frank,

[...]

>> +patternProperties:
>> +  "^channel@[0-1]$":
>> +    type: object
>> +    description: Represents a channel of LDB.

...

>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input port of the channel.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output port of the channel.
> 
> most likely port@<n> should be under ports.

The topology here is a bit different, the ports are directly under 
channel, just like (usually) endpoints would be under port . I think 
this is correct, even if I agree it does look odd.

The rest is fixed, thanks !

