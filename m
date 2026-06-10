Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C5DCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVCneA61j9/Mv1FcSX1dBIQFass/grRjgoNTeP0soOo=; b=zDdzfSSsXbTlTYzavlQ0EyC0Lu
	M4yU3xUTjnoE1O9PN0rYofHqG21jE0OGNXW4agtJGWYW9usAH3PQ6caHHybLI7NdzeYR+ylUU+3Ah
	5KHb6Y3X5AmLLK+lR4zF1OR+THl9CUcQHfGLJwNPV8wqwYE32i7M/If5hy+RR2NclHA/QYuJelCl7
	ZrrIyu4rtHr04ZnsvCB8gh0EQNCM/TbaVwTUoVegP+gP5Ub8h64iFRdQ04MT3aabO+NwNSS1e6AG5
	EewEJPZyIWl/EBjcmLFhXfJ2VV5Bq4mjF6SI07H/k651Be7C6HR2REowiGOeAOF2JWL7mnMsI1yMz
	bvUEmsOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXExT-00000007BQh-2VY3;
	Wed, 10 Jun 2026 09:10:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXExQ-00000007BQ3-1fMf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:10:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490b7866869so71858105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781082642; x=1781687442; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVCneA61j9/Mv1FcSX1dBIQFass/grRjgoNTeP0soOo=;
        b=Bx+xn+QPmwVM/mMWauJ2C534XFoPGa+A9/JA9A+AzrciGa7btdlOPxtE9nf/qF7Umq
         o9wWdDcMVoABpSsfhc+r4AY0ytm0DcJTjlAHIEE0am52IiFhNl4E+dFDsDgQKAZoik61
         mWGiDsmlqCIX6msH5pA/5OP8DPpEYXB8QKUu0hyLMI6YqbPh/yzFvN7jNDvFL/+9hpCh
         q8wHvdo3j72Y48dIicAD8WGdLIvcxOOP3Ohb5VczxdzcGprUrdxYkB18/hD28b/uAjHH
         +GNBRVTADSGlcshjndFiOa1m7pQuIw0ClyKjlX8CbpGcudMYEis7RzVUynqIssZgzrki
         VH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082642; x=1781687442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVCneA61j9/Mv1FcSX1dBIQFass/grRjgoNTeP0soOo=;
        b=Vjnjt8Kj0GbbPbeO+pPq6UG11r4CLqMQko/RXZpurzIMDoOZrab8g89bGPkty/VwSt
         bcclO8l0LEZzo8+b7PgzkxNe5wND+fYseaDLXTn4/d4n9yistFQVSCJStFRB1kFgCxaI
         cEdl6eiUU7CiCSFrD9765wjuZfksUdV1nI4xOAlxJ38GLTiFFeG3nGnKESex9Srn3IxO
         ycpRS8bg73mSIp8UtgTtF8e/fs+683pQ4d2tqvDRmikcIwUoskueelvhbqw94dByxuMZ
         hbtve7KwgqM+j9d++vIKvh97yWPvTXliFrm89kPZft8XsY5IBTYaNKoV1ayHyXBZ3Tw2
         B7fw==
X-Forwarded-Encrypted: i=1; AFNElJ/BjlvOa9f2wS0zs7Q8K7ZW4LjjsGB97h32onHvpGOsXW+I8M3RtTD1m3UXdoo31JDAIglPhnLom4WZ5lhoW/yQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4CUR7OB8GwH6BHff0b4xYa9NGGmgWTarF45W1KiFb860FzmIn
	1odatL9LMWOXSSbOJZLwSG2n7j6dNLotV06EE7ghnIYhjp5NRwZaCdFc
X-Gm-Gg: Acq92OFD6ha1nhm0UaE+5gHy2S5H7oElOCOpAfQxYEC7ssEVH6FgGMM032/0ocIQOYE
	/Nf1gED05v4YOQOoXgvkSMEEh95JQvSXWlQemn7Unp0TkEzgn6CoKKg0mhwZ2vTU2D5EMFO7YhF
	zU1VSax6U7dbo1L09Dd/F0n3vHCbH/Uj9uw12lMr6yj9TjG2VwJOYGo83bFrNcaQzLGVkMrKt6a
	/SLMl4AkXUnWDya2REGzwNgKJBpNbsme9ZdNGB/qAJU1VXmTb34IwLS8xHBlzJABfTsKYW6vMZ5
	w7mgTirchY+votm+4MGcREMu/yuymtptUcDMYUYrB/Al8n3WY0DYWos+Pn0eLBkRiVifhXbRvGq
	H9D9FGphhee56dR9jt2YjTDCl/PX/8d140gFA/47fowRL1FAzHRhWdDFRLvSLGKDtle1JeZ6IBC
	Q1mltn+RNI+UeBXnmPzZTAwPVRLqRYGaHBev2WhR0WJeZ3vfMeErhC80KF3CJNMLnRrKs=
X-Received: by 2002:a05:600c:8518:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490c4993bdbmr423122135e9.24.1781082641859;
        Wed, 10 Jun 2026 02:10:41 -0700 (PDT)
Received: from [10.25.222.173] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm579850645e9.1.2026.06.10.02.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:10:41 -0700 (PDT)
Message-ID: <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>
Date: Wed, 10 Jun 2026 02:10:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_021044_455393_67BC9FED 
X-CRM114-Status: GOOD (  18.59  )
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



On 6/10/2026 12:37 AM, Krzysztof Kozlowski wrote:
> On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The names of the carveout regions are derived using the names of the
>> reserved memory devicetree nodes, which are referenced using the
>> "memory-region" property. This adds a restriction on the names of said
>> devicetree nodes, often bearing specific names such as: "vdevbuffer",
>> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
>> specification's recommendation, which states that the devicetree node
>> names should be generic.
> 
> No, it does not. Names like rsc-table feels exactly like DT spec is
> asking - for a name matching purpose. Are you sure you read the spec?

Quoting from the spec:

"The name of a node should be somewhat generic, reflecting the function of the
device and not its precise programming model"

and looking at the examples provided in "2.2.2 Generic Names Recommendation",
wouldn't "memory" be a more appropriate choice for the DT node name instead of
"rsc-table" since it's more generic, while still matching the purpose
of the device? Or perhaps I'm interpreting this the wrong way?

> 
>>
>> Fix this by documenting an additional, optional property:
>> "memory-region-names". This way, the carveout names can use the values
>> passed via "memory-region-names", while keeping the devicetree node
>> names of the reserved memory regions generic.
> 
> I don't see how anything here is fixed. memory-region-names has nothing
> to do with node names.

The idea here is that the names of the carveout regions can now be passed
via the "memory-region-names" property. Previously, we were using the DT
node names for that.

Thus, we can now use the more generic "memory" name for the DT nodes since we
no longer use them for the carveout names.

> 
> Best regards,
> Krzysztof


