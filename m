Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACC5E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HldRgXZlNwLf5fyqIyt/xpE8o9fTDtPf3iGgDTBBGX4=; b=xarNnF3wP5RjcNv3BlRV+4RKga
	SKQxcV17WfE8PfPecWbE+XpHZVdIddrVM6qZEzsMnRKvYWDkZUl34ihBGORVAOeCV7k/WYNlExKxO
	XQqTpTLI7k3yKPDdg1rZbRJXvNYgAAN4/IeFf2HFlKikVXvcEmTbeRInTYFusz9FfWPtjHJGZhdP5
	yIw1otVOqL1ywCNAbGycMs7t+Q/DF28/5bB9MDJfynDsjseeodoUAn1A4iq1UJavvMGA7gTHsCAvP
	vMbKgSX4Lvk+c/fqGA+yjcfix2T7lAAKaBU8iVjbLcLmqJUjHJ5ks0zWTB+UVRoNrWzX6WPPJ6Jv0
	SYa36mtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbM1-00000007Ndd-0aKG;
	Mon, 09 Dec 2024 10:51:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbKx-00000007NRY-2mVs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:50:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385d851e7c3so339584f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 02:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733741397; x=1734346197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HldRgXZlNwLf5fyqIyt/xpE8o9fTDtPf3iGgDTBBGX4=;
        b=nN4XTIMvWtgL96otH4wK6mu9JAbMwmoIHaxQqfb9hYMeXDbadL7W9994Tt9kO0UjKP
         nZnN63bS8a0e2lcsALDyXSnmCvJEmrIFFKbyIwES7B1a3nktO9gWrxMmswsqURLFAsgF
         ZVKECA18dLE4N1LQ+UcSYKU5rcPLwIE0KtfoBpFKiawiMVqrEUiQzKrNj+UErMPg6cLd
         w6ZkIXOlggs2NLpOhCb1b1AfgAZ/o/wwtzUSfkh5j40xk++YnZg7cEnu4PXyFmpmo4uh
         6E4z0QDUKM1wcjT63+QaFcurJxRqM1IsNRJ2ZiUvJ2A9F2n3tD9A1m0YhE+Z39IBpX12
         lIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741397; x=1734346197;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HldRgXZlNwLf5fyqIyt/xpE8o9fTDtPf3iGgDTBBGX4=;
        b=MjVmoY/sEcBn3PoWiGC/YqErmFW1FJv4wB4tbzBq82oNQ2g16maiJA+CyATJ+B+PZO
         4s+Y1iRcta1+t4aT6fzR4/6rGupKc9mCktfFjof0co89OdpkvCEboLCFEW1jXutqdtLP
         VIqOWj+hqJqF+wougIHRDZrMABVhauPthN6RJ8HMw1EyrRN2N1oYXtWY7f1i7H5FO3Rs
         /fva+p49+9Z2OD67giN0kMqZVsiaajwRGTzxcjrOsHifZOoW0qVczYDRjz8D3k9phx9/
         6xNn3BftB0D5oiRh8/KWJf/EtB0F3FsXcxXMwt/gsdG7SGFW/NcUJGH10iMDyDTRO975
         0gNg==
X-Forwarded-Encrypted: i=1; AJvYcCXciRg/Gvd7YFLxjS+JOSWiD1E5Miz6GmnSbt5rUZOJehyoeESfBlC+5s+LI85a87obFY60GJYTzRjXs3HKL0HT@lists.infradead.org
X-Gm-Message-State: AOJu0YwQpvV2Q3DJ/Sz9bBKwMZRpt+8MRC+8ula4SqlPpyhPnwnfpovQ
	v1s4WlBKC4Lrj8T67Ow39KNyFg3CP91748bIL1o6uuY3O8Qpp74/xrcc8PT0fVY=
X-Gm-Gg: ASbGnctvfNoGLWcao0Hd2Nh1t75bGxuT2s2vCRxfDqTvPJrIfzP+MC4A3c0IaNR+6p4
	05piFm5akZR7+m+4C5aR2+4v2W8JUPS61yoYa6QOWKszKoXW9oT3mkf1BRyK3KI392rOgvcEmlG
	OL21/OQPDojcP5VVpBGIV/ESnWBQIt403hPEBzCvrDOf9oj9qJsMaQKSBCAjePy3O+ezfUASnUU
	f6Rwfavc4dpabX4W0Fj9W1Eb5F1eDo+AX36oh0QG3p2EI06f9CWH4HdTw8QOWikbQ==
X-Google-Smtp-Source: AGHT+IHxRoXs2saioOScD36Qx8G113XvIArop5p7MfwoQX5UHxDTuYrweuCHNEqAi0Kh1dl9f33ubg==
X-Received: by 2002:a5d:64ec:0:b0:385:ea11:dd8f with SMTP id ffacd0b85a97d-3862b368a48mr3146673f8f.7.1733741397649;
        Mon, 09 Dec 2024 02:49:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434ea1ae415sm80301445e9.33.2024.12.09.02.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:49:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241204145559.524932-2-igor.belwon@mentallysanemainliners.org>
References: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
 <20241204145559.524932-2-igor.belwon@mentallysanemainliners.org>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: soc: samsung: exynos-pmu:
 Add exynos990-pmu compatible
Message-Id: <173374139637.46435.13275133164438214681.b4-ty@linaro.org>
Date: Mon, 09 Dec 2024 11:49:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_024959_727667_2110A8FB 
X-CRM114-Status: UNSURE (   7.74  )
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


On Wed, 04 Dec 2024 15:55:58 +0100, Igor Belwon wrote:
> Add a dt-binding compatible for the Exynos990 PMU. It's compatible
> with the Exynos7 PMU design. It handles system reboot, as well as
> other system control registers (i.e registers for the USB PHY).
> 
> 

Applied, thanks!

[1/2] dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
      https://git.kernel.org/krzk/linux/c/33ebc0fb73ba8fabbc1c8f581f7f512a0b277645

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


