Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29663C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 08:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUUln88n+vvb0xdyre8bwQBB4xlA9ax/lxsdgBJNE7Y=; b=Zcra7gW15Q58SzGcYUJk9YBsJD
	Nmcp6JCprxoqX/UEej20hgbMK1YdrNbNqPIjxBqMUq8Jm8A12lxXfO7vWzcHfm2mmKZEfEo7hmLYg
	+FB5AB3JGB++X5fChtSyXUidCbzpCt+9Sqot93Pi9ayOnNcktcoCfL64Sx0pjd91gn93HAH31HODd
	grqphQ8jwpZlyhUT20iDHrC82W3WM01gQd9T0eUDDOeQ6tHN6JnC/hn6Ia1qem3Yc3DcEk2euQXV5
	ArUzd/yksQ7QjgdRKLW9ZNC4+k2ugnn4aJyOl6wfhtJFE+sUjOJhkkuFO65Dzw3fYTS82ooaFZ0Om
	HH6/x+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQYN-000000081ll-3EEp;
	Wed, 09 Jul 2025 08:53:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPCd-00000007oEP-2YPr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:26:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-453079c1e2eso4211915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 00:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752046010; x=1752650810; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XUUln88n+vvb0xdyre8bwQBB4xlA9ax/lxsdgBJNE7Y=;
        b=xfxM6QRUH1kSmDDuZhzvxaZ29Jdhbv/yC+2DFgx5doZLUiViXfPz1pCCfnotmhRpGF
         CybXDpj55t9pGuB9TPfD8tSaR3vyP8oWLqRNewrUmEaJIie9HFpRUVxpdviD2mn8B8N9
         XZoUmLKAHxdycpddbYjrnVbnNqKJ87gj7Ja7aoCVDekyDJFgC/qetptpVYkGH+Yq6jP5
         H8kp4LDCECtEb1c/68KD5Xu25BG1ZCBcuYq+nZXhun+yTqotb1ab/Uvs6QTxG80cPgow
         lemnAROEvbcGfRNAYKx7wZu2XdNKz1u5RvGQgDNQZ5JCS59RsQeQjnuxx7i6Vqx+T9Um
         Kcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752046010; x=1752650810;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUUln88n+vvb0xdyre8bwQBB4xlA9ax/lxsdgBJNE7Y=;
        b=Gz3DHm1ZELogxYflm43nMzV5+o16SVdn2f/jGdpN8tIjvNQcaMXHGGEPAjxPlv9D+D
         W8gTauGaRlvozHBAPgggPevP2DD6FTIm0fQ0xCdBj8hI7gROHbi8wWgZkTTaJWBfJY2E
         pFud1IPywQ/h74xFQOibRP2pfazYAbJCB4MgcbzocBDeFJa1E6MELelyf/PpXl9tMQds
         yyh8jr8Dkiho0cm0xdT7K9qRK7oW3S5N16KF+LGOBD4s7TEOsax4SWOA5wNRMM00Mtei
         EMT9Ays2e7BPSAEWpDA3at8UMxWN5+dcG9aEcqI9w83GI6fcvualsGmGKg/7dvIx2vXe
         iBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6cBVlmjnjanHIvEQDmCH7VY5NMZzfVAzmgE89C/UKjaslDRR3GxfXkTIORUp0Rw8iNTCCQGQiC5njOAXg30f1@lists.infradead.org
X-Gm-Message-State: AOJu0YxKSwyfk34BobAf145X7+0N5sUxtBiwf/O/5we/1zrT2DnbG6l2
	607lQz1gltsPwoi4o5XWLApbH7S2O8WRr8ukYJKJ8CVRoeRvTcz8cbimapPDxlUaq7g3Wtqoe9M
	IQ+wA
X-Gm-Gg: ASbGncuZ4LR1asR8rX/icJymej7wFw3Vq5RPmd2C3qJYfymKMG/10q8/OcuVC0e9/Qy
	4n0cDrS38O7JsKIR+bZQz86hzwpaMxpKA6tnYGjppEYb5D+EnctGJwTItTXn8+ksBBBT0uhtBTe
	GovyZQIVQYimJ8VKc8H9V5MfGN3Xh0Oxq02SvvZ1iEC/iGENKx5aMPKCryIQS55EJuLDfmXZm2o
	+Q9b4sJbxmsQw8SLfBdFKtzNLD3Uw7INQWKqqy0WZ/lgeTrkx6NP+ePVHFLlke9ji6D9vpo9+ns
	pVfoCL0kweapYttUzJuZVDVoxeMlhtHxTZdJV6IB4bfgr8SNcOQEWdvbwjlJjtvm1t9CyXnOZyN
	11H0aGg==
X-Google-Smtp-Source: AGHT+IHZpo9yVzRnXdUKvTXY9ZQtWtBLdKSOZfU7YVv7hkzlMjlyi3VsozBWY+UWea6vDF42mm0qzQ==
X-Received: by 2002:a05:600c:37c5:b0:451:dee4:cd07 with SMTP id 5b1f17b1804b1-454d52681e5mr4298385e9.0.1752046009717;
        Wed, 09 Jul 2025 00:26:49 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470f871casm14962751f8f.45.2025.07.09.00.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 00:26:49 -0700 (PDT)
Message-ID: <3f2938ce-8045-44dd-aee6-542779cd9916@linaro.org>
Date: Wed, 9 Jul 2025 09:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clocksource: timer-cadence-ttc: Support TTC device
 configured as PWM
To: "Rao, Appana Durga Kedareswara" <appana.durga.kedareswara.rao@amd.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>,
 "Vanukuri, Meher Thanmaiee" <MeherThanmaiee.Vanukuri@amd.com>
References: <20250115113556.2832282-1-mubin.sayyed@amd.com>
 <20250115113556.2832282-3-mubin.sayyed@amd.com>
 <hwnhz4yr6vzz3oav4gq7qptejjy3rdwff7iveawaxexf3tbngr@pnrxi6jkpw3k>
 <DS7PR12MB824987018AAB745E38C638728F7CA@DS7PR12MB8249.namprd12.prod.outlook.com>
 <DS7PR12MB82495FE4A65F266D0857EB408F49A@DS7PR12MB8249.namprd12.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <DS7PR12MB82495FE4A65F266D0857EB408F49A@DS7PR12MB8249.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_002651_771788_91537D3C 
X-CRM114-Status: UNSURE (   5.75  )
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

On 09/07/2025 08:51, Rao, Appana Durga Kedareswara wrote:
> Ping!

You responded after three months and now you keep pinging on that? No,
implement entire feedback and then start working on recent Linux kernel.

Best regards,
Krzysztof

