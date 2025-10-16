Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7B7CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2ypzUBcWsUqTIXgsF8JXfZwJi1SAGJzy/+9Dlfy/QU=; b=SGNM4znhuqdGJ6mrM9hGtS7yXp
	aOx+t8NW+a5JJ3DeZhKADZG+2lNIbZPmWsWQ1e1jlSciBJwyXGu6oJTkkeJt4yJmX7hC9lBnMRPDK
	eHplgi2J7ubgE8naQr1nzWttlD+fM0tNwJdPHNexkoLJN5607TWOPhstWCHqSAj8rxIuuoOAhRyE3
	Wa6ciAJHxhOLV1wO2v8gLdaFyAvSWwWgLECKI6r/HJ8pH7SjfVe6TE2ojsUaFzQTeJJI/aDpNjIKk
	BMyjITDpbInyrOKOd6Em6iiNu8jadHHd5lQDCcrqyxZsl6IkROI/C8v/AsZ3U+4+HDiwwS0ew4q0t
	jgCPumEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Gw1-00000003Xot-2jX6;
	Thu, 16 Oct 2025 05:53:57 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Gvv-00000003XlG-1DB2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 05:53:56 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251016055341epoutp025ae7df92497a651f7e652868492867b7~u4u9KhdIH0561305613epoutp029
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 05:53:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251016055341epoutp025ae7df92497a651f7e652868492867b7~u4u9KhdIH0561305613epoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760594021;
	bh=z2ypzUBcWsUqTIXgsF8JXfZwJi1SAGJzy/+9Dlfy/QU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=VmpOb6OVVUaQYzAo0awrm5AOgB7QXefsBoWKwVxcHOwQnUbxCJBwuia7rU9Qf4Sr1
	 vdcFfXWwGEvzZa7vJ+9ZGUUNE4kvbCDdeWCePXeV8Y8lctxq+YDoYWdHy7IuNzvn5W
	 Vn3FMqLsTRAzho/ngR1D2oiHc+73irEremZZT9J8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20251016055341epcas2p2d516a747f9a7b8abb3e6b7b2e1b7314e~u4u8qPRRC2084520845epcas2p2M;
	Thu, 16 Oct 2025 05:53:41 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.203]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cnHFJ624vz2SSKZ; Thu, 16 Oct
	2025 05:53:40 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20251016055340epcas2p32ef2561a9a5d91e7deba938cc0726965~u4u7mlIJa2970229702epcas2p3q;
	Thu, 16 Oct 2025 05:53:40 +0000 (GMT)
Received: from KORCO115296 (unknown [12.80.207.128]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251016055339epsmtip116886c713983525e1e5383faeb4afbae~u4u7gq99m2565525655epsmtip1u;
	Thu, 16 Oct 2025 05:53:39 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Bartlomiej Zolnierkiewicz'"
	<bzolnier@gmail.com>, "'Rafael J . Wysocki'" <rafael@kernel.org>, "'Daniel
 Lezcano'" <daniel.lezcano@linaro.org>, "'Zhang Rui'" <rui.zhang@intel.com>,
	"'Lukasz	Luba'" <lukasz.luba@arm.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Henrik Grimler'" <henrik@grimler.se>
Cc: <linux-pm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <5747ce14-2963-4c5f-b43b-5437807cfb11@kernel.org>
Subject: RE: [PATCH v6 1/3] dt-bindings: thermal: samsung: Adjust
 '#thermal-sensor-cells' to 1
Date: Thu, 16 Oct 2025 14:53:30 +0900
Message-ID: <001e01dc3e61$38c3fb30$aa4bf190$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQIjrV0tYij4Y9dxV2JVizj4BALpcQLXJsyWAWfT4LgCVC5cw7QAy2lw
Content-Language: ko
X-CMS-MailID: 20251016055340epcas2p32ef2561a9a5d91e7deba938cc0726965
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930005147epcas2p2622ff5fdbffc045bbd625e3e60db8118
References: <20250930005139.1424963-1-shin.son@samsung.com>
	<CGME20250930005147epcas2p2622ff5fdbffc045bbd625e3e60db8118@epcas2p2.samsung.com>
	<20250930005139.1424963-2-shin.son@samsung.com>
	<5747ce14-2963-4c5f-b43b-5437807cfb11@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_225352_767247_518E79F0 
X-CRM114-Status: GOOD (  15.82  )
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

Hello Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: Friday, October 10, 2025 9:44 PM
> To: Shin Son <shin.son@samsung.com>; Bartlomiej Zolnierkiewicz
> <bzolnier@gmail.com>; Rafael J . Wysocki <rafael@kernel.org>; Daniel
> Lezcano <daniel.lezcano@linaro.org>; Zhang Rui <rui.zhang@intel.com>;
> Lukasz Luba <lukasz.luba@arm.com>; Rob Herring <robh@kernel.org>; Conor
> Dooley <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>;
> Henrik Grimler <henrik@grimler.se>
> Cc: linux-pm@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v6 1/3] dt-bindings: thermal: samsung: Adjust
> '#thermal-sensor-cells' to 1
> 
> On 30/09/2025 02:51, Shin Son wrote:
> >          reg:
> >            minItems: 1
> >            maxItems: 1
> > +        '#thermal-sensor-cells':
> > +          const: 0
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynosautov920-tmu
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 1
> 
> You can drop minItems. Existing binding has it unnecessarily.

Ok, I'll drop it.

> 
> > +          maxItems: 1
> 
> You also need clock-names restriction, just like clocks or just ": false".
>

I'll add the clock-names restriction. Thanks.

 
> > +        reg:
> > +          minItems: 1
> 
> This also drop.

Ok, I'll also drop it.

 
> > +          maxItems: 1
> > +        '#thermal-sensor-cells':
> > +          const: 1
> >
> 
> 
> Rest looks fine, so with changes above:
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Ok, I'll add the reviewer tag on the patches.

> 
> 
> Best regards,
> Krzysztof

Best regards,
Shin Son


