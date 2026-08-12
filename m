Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331A4C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqVtyUs3B3LjBriNPXaVFL6YD2XVSQF7G6/cSzqiF+I=; b=kqQ1W2fmYGKb5pzzHsSIZpBt5T
	GlfLswrgAt8MBxmM4C4poqlAWQG2zOz7gzfW8ZprnYlLqpnzGh8PKXiHq4hzSXImBju9Fy81nwNbb
	RUfRfBPP/AM7F5CeIR9WUqoqlu7XV88M0m+ocVzGU/iYEeMV9UwzCkr1TlSSgoOA1pEKrpk9wTs4X
	33wAzXmQTyABv43C/Ugw4frSyLGDnryNwBVTm/1U6jqEuO+WmxeLl8XVqRtZLcoUTESDKPhSD0E0K
	cBPKNbPBoPGrxu3jz9ldMnFF/dLkBUvG478zDN9yXwn6l/qQE+3AS0E3AC6oGd1gIQCC7vOwW7kUY
	KaN4SlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu779-0000000G44N-30Cp;
	Wed, 12 Aug 2026 11:27:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu772-0000000G3xB-2NmG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:27:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so4369035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786534031; x=1787138831; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqVtyUs3B3LjBriNPXaVFL6YD2XVSQF7G6/cSzqiF+I=;
        b=g0UNxHx+62pJXskKe5blq+F70wz2SR7Rp0kNu8XCHW5KoBNPHCrgcHs0OVkooxJqDR
         9bBByuF3/C+GbXbYCVd3OSSqJ8/CQT2W4fizGIERA3qvynemuh5HN2SY/fVhGy3b59yc
         kqaJwakckJeaNonrsoeS8xgxh9c390dIRTtWTHCx7hOhR6U2ZCW+Y8iStQsyDT8y6HAO
         +6brn5Lb3e5Yowd9TBd49V78O50dJt4PAe058KB//CGDSEZVjkRSGo+oPqZiZrNQoocp
         K2egc24lqP5IM98rVnPA5yYsCIl8hI2edULFr7QRUbErzQprsT+u4wLmyIfIobnKyzrV
         iO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534031; x=1787138831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqVtyUs3B3LjBriNPXaVFL6YD2XVSQF7G6/cSzqiF+I=;
        b=FH5v4ICIHKiOY0rR2t5gKHMqlpg3NVoJrOe0r0zHxWUHUxQiRMfs+/vnXpIjk2QlCZ
         3rKa2bBvA+NBnhQQhjlAoz5PyeqGvUK98JuwFu0E/5q7H5Z5uv9QXKbUZZfST42POYkG
         mwfHZeVD0TJNXMsD5ec35tYvO0O2e5uXB3d9XYr8sV8CwZ6oq4xWc7ZngU8HBWQ4pFTl
         gC2HSaUjztw325fq4zX4cLdTah4g+ADryIMCK7Rof3TOrvkze6UgcaL7KQurS+SInGhv
         qJCl2d79nIgHYjjskRuFdtIZnn21dwpQs6lVrj4YixT79CtK8uztQm2wZ72BMRoWvmix
         WiYw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7gP1EQftdB0iN17pmhpZnZNmlbkgX1vCNIDEQk5C2e7X2ImIm3dYTJXsh0+4oUqZV665a6bi2uBF5+EmeWHky@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/ZZbilMvvioWQwggzNm5UD9Z3UBI6V4GRBiuQIJSuV1F3DfgQ
	HKulplcg1oAVBGVEulBKkFc0kkYeTdmsKs3ZcrkbWW4KKwpAvvzpXped
X-Gm-Gg: AR+sD12JEzQfR5AO+mN92Bs/c6FRQ5Bg0WqRH+hNQMf1ZNPt1nv+ucD0q2mj5a6Xvka
	i+FzlJf4FNqM0l+jKOoaNr2KfdFE+Cunks4atyJo+xeZiJIM6PJFCm2XR8aPuCILySXJMjhWujg
	oVY2lzON6CIFFyvTS4M1zLewYs5ayfROmTrOL55mt9oaDzt2rfQdLGRPXAXvsSqx8mQrGBDVfB9
	4T9k4ak7LwF86MBxsiiEfTOProjDWL/5R72UDJzXyfpKRvGhP1VoIWfitMy59sHrRsBxABNEEoX
	JxCQjmhpRw/i77W5+qw+IaT6kQ/kkeMdWksbeQfZ3urv4FSGxT3pnqkaA6qUo/JFo3+/ITauxfd
	JjWSo6PnbgWqYBA0xEkn0qWE3HtUG0jmnHvccIRo3jFwTw4kyy3kOm31mraEZw+po79Eap1FNau
	hJQzdT2QJZlJ484jBUwgqLy47zIDVDlxz8/+K/0mCQCjgNAe1Ql/B8NZimEZV7HQ05cL0WKbAoe
	z4+U23GW0CtlM+mdZrWXA==
X-Received: by 2002:a05:600c:468e:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-4997c127e00mr50618625e9.13.1786534030648;
        Wed, 12 Aug 2026 04:27:10 -0700 (PDT)
Received: from [10.25.219.170] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aa3ebe0sm75222995e9.0.2026.08.12.04.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:27:10 -0700 (PDT)
Message-ID: <f4bf1557-9f09-4846-9352-18587cd6e406@gmail.com>
Date: Wed, 12 Aug 2026 04:27:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] remoteproc: imx_rpoc: fix carveout name parsing
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta
 <daniel.baluta@oss.nxp.com>, Francesco Dolcini <francesco@dolcini.it>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
 <20260731-sweet-curvy-lion-bf0215@quoll>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260731-sweet-curvy-lion-bf0215@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_042712_751633_249D95A3 
X-CRM114-Status: GOOD (  12.84  )
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



On 7/31/2026 2:38 AM, Krzysztof Kozlowski wrote:
> On Thu, Jul 30, 2026 at 09:34:10AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The imx remoteproc driver assumes that the names of the reserved memory
>> regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
>> conflicts with the devicetree specification's recommendation, which states
>> that the names of the devicetree nodes should be generic.
> 
> This is not true and I already told you that at v2.
> 
> Best regards,
> Krzysztof
> 

Unintentional. Forgot to update commit message. Sorry for the noise. Will update.


