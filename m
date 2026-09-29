Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E478FCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 18:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mz+DR/cNP0US6qM+V0NJZZkwyCBeScDtMfTKHVJnik=; b=ShRXNeYgSFvFGVWfx+eD5/qJBY
	KhFKwD478kkcEbOcO4sVD44BP04fWJQXmevx+SqgejTjlet6PS4ZMqMNXa1RF4hMu0GvuBaJ/AfA4
	MlaOT2RPL9UsATEeR9i+MLrESr7K+6lUXau2n54cAfr6kV01+I9xVViyx6YtYH46G2J6Sl3X41lXb
	VbLsZD2GFFkm9hF+Rh9AFTC66rEW1TEuQHSmE9BHoPqVIFr/q64LTn4SnvPQgOZoMIZydJNgDwTaI
	rBjv0/ag3EKCRhU6jWahHmKhIHz5k+0ctLgM4/gAiAmEhfqeQJcfMzMe4Sq5FMSWbj7gU3r3w+qsj
	ML1sGDcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcjR-00000004IPm-0YQS;
	Tue, 29 Sep 2026 18:39:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcjP-00000004IPI-2l6v;
	Tue, 29 Sep 2026 18:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+mz+DR/cNP0US6qM+V0NJZZkwyCBeScDtMfTKHVJnik=; b=It2V2EhRfVsp0r24BzxuxeIE4f
	cwaIF+OmtKNRNOz7yyQDfAmw6GFF5I4n/ULTobjR+WqZPTmSMAIOLIr1LHAIJtBub9VJDwLXLxx/i
	QiiSMmu6waDxNk9bXCmYiPedXmSFF+zw1+qgEqT+9bvIWPBsBRZiJKcRZyj9u87d58yi28kqnLr7x
	fcNT1S5l/L1GpQ6EEwpn/w61boNJVMBcYKKP6C9N0jjRAqaG9pMWfPq0qV/Yq9T6+SlxokRuEKW8x
	CJm/U/6q53lM8o+xm5r4IFRC8eNfr90u+DYL1zNKVtS7/a00pwt19JK3GO7cFgkVPDkiuDCWg+nbM
	lnmaVmYA==;
Received: from mx.nabladev.com ([178.251.229.89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBcjM-00000002xOS-016p;
	Tue, 29 Sep 2026 18:39:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF779106CA0;
	Tue, 29 Sep 2026 20:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790707133;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+mz+DR/cNP0US6qM+V0NJZZkwyCBeScDtMfTKHVJnik=;
	b=VZGtWy+TnRRjNQTbwO2hS2qxQNoSfigFgLQtQ6lSy8wTUxCm1pSlqzLhf6Hmf2ySNOMvI4
	1nXo68OLK7P+vcD/tS9Z75jRByo2YGJ0Ckh8JCy4jbC4gaJjheDrs6+XjLJLXVbOCOvZjK
	aFWhTXRZy7dR7vD4exC2woOXd5Nuv3nnW+ZbL5vUzqYXKwlCDmj1AViVQCugILH2uaogI8
	S8rMDr/EKcMVwMwQM72JxK/GjZlIqIst8zJPbjFczbIxUY2qCCwRyG3lWdSUZp/jHN5OxJ
	8H9A8lYrbJBq3UqTsnptbFDlO7P8rqj8fK5GP5leIJeQewqlebMFSvL6Kru3Zw==
Message-ID: <0a65ca90-2b0f-4f58-94bb-11fa2737519a@nabladev.com>
Date: Tue, 29 Sep 2026 20:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring
 <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260902141312.649406-1-marex@nabladev.com>
 <20260902141312.649406-2-marex@nabladev.com>
 <bf8e7888-1917-4ddc-9a6d-20490835c742@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <bf8e7888-1917-4ddc-9a6d-20490835c742@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_193908_182791_BAB08735 
X-CRM114-Status: UNSURE (   9.52  )
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

On 9/3/26 12:19 PM, Fabrice Gasnier wrote:
> On 9/2/26 16:13, Marek Vasut wrote:
>> From: Pankaj Dev <pankaj.dev@st.com>
>>
>> Add USB2 PHY driver for STM32MP25 USB2 controllers, which includes the
>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>> slightly different, therefore they use different compatible string
>> to discern them.
> 
> Hello Marek,
> 
> I'm not sure if/how this fit with all below tags. For all the
> contributions you've made, you can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Is there anything left to do with this series ?

Thank you for your help !

