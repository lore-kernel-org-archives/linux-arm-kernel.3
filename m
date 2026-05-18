Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDEECD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHZ0whw83+z9VXkW6TAErZNmADE39pTiQfjcBIXSbTk=; b=C/UQYnndpzvgvKdHZYLGFW5a9i
	234zu4Ud1EVTFXXeQ0rzKWXaU4jJsRWejiBAglvs1qEsl/NrJ33ndYK2bKKn4tJG4AIJdVowW7A9R
	hTxbkyEWfTct/u6Qk3mKt+2XoM9G3qUlu2DMRzKkXsLSjtXiBo9WLqQxu3so9ZFMcqf079WyzvbWT
	m7C+7bZV6BReL/evZhVkJj80NHcdtkfW6N8sYzCnWMuniC53h1luooubNhW+4CMWceF0715tKt5FW
	nbEwPRBdYufvcuWYvq9v1ZULfqLc75MIfZKW6BRYv09LkBjkZ6p095IZI8586eet0DSjpKiORCK+a
	cvRX8WVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwAo-0000000FR9O-34pH;
	Mon, 18 May 2026 11:30:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwAn-0000000FR8e-1WxH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 11:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UHZ0whw83+z9VXkW6TAErZNmADE39pTiQfjcBIXSbTk=; b=elUSEPJ7gcZMSen/EScdGDP1x3
	Ccdg5PrTgWxaurEvTN1fm33Uw1Dg3iGY5ak4rF4XPscsMQ1oeh+kmfLy/pf/+3emZju/XNzXE4rTa
	aOh1q4wUfM7hvflFd0pjq25Gyfk91NT9RaCTZNi/YjNxUVAcnVkvXTeLR0VHK/LxO+YuJHqCWjkeq
	qC3ceNlQEO7CDZE/LAG62SXk3c/lqD6WMT0EO3yKBSh49EVSkLy/O1rIaOXSyPeygc5j67Ldl/rpO
	RwtL5bJ8KFeOYguhjw5BejEH+tROfrgdRhTU47Ynx2rL1HgzCXwCa6W/psYwjkVdGGX9GUz0N27Cb
	XtIf+XSg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwAj-0000000AwTk-0M35
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:30:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso10624135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 04:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779103807; x=1779708607; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHZ0whw83+z9VXkW6TAErZNmADE39pTiQfjcBIXSbTk=;
        b=hN9wtYpASjL2EheNColqsZfjxzOT+8JGXEeF7uFCepE4rh+dX90d1aC7WmfVVrVMvz
         XaJF5amTZ0bN08BxEX5oatoAn9XToJMe6dN9ABHAbAH9iL1r8gHB72b3L+Ndb2ncEiJK
         O4fSRArzX1P8wHdnBFGc12DxzQnJCcFwPtqKTTN94SF6JG97LXAV2vS07ZNBOeMwBX5h
         witP+xDaUzFj5tIvzJQmK69sSz1blzlSMK4pjC15DwRZ+mBHTRtRqZDWseENpBMGd2HS
         io4rxDvUlxzLGb6YL82t58WMeWSelcI/0OfbwpLt7tytxiv8gmvVP8VUGtQAhmLGOz88
         zyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103807; x=1779708607;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHZ0whw83+z9VXkW6TAErZNmADE39pTiQfjcBIXSbTk=;
        b=QyMCxQIaFYcWB4ArQsMxks1jM18U95leu7cmf3/FLR5ltlrNPh2pcUpcoEYGBmL4Kf
         IDNFwREBUc/o9fcHlOJQNdMkI+S7J0Dle56GuoOZZ74jI8c5TTKy0Z1uETUFeb/jFhn9
         5DbZE6T2e9AxaJfq1e5q3eqjG0+LdujDAZCtS2uLecKP1C3ndL4U/06iHZRVS/HoxjHB
         lgJyYnqgo8zXk7PYMy7Z4NpFdtOnhuHSjk2JqboGkj0UgrKDvCdbXHSIsFyHsxiOmjQl
         XQRjWHrmuJ/SisiEzH0KMIUIBqPzlyfw+A9mSEyQb5Zgm8m8JDpdQJZSgIo6LKXAFhwL
         Qgxw==
X-Forwarded-Encrypted: i=1; AFNElJ/lSzUE8NgRbUJIF0M/XbstDJZYnWe6XU6bLQzWoJupwCIji3yirkxIgAi+kzn0EBAf7NfvwBsrmtcmEvEDZ4pB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/QcOFg8UjnfuqYlfqyFBizB9UHDsDpzc3Z9kq2reeIxuWVH0l
	PFWUYB6XYn7ixwlDkLYULNk+/+pkXfcImxgr4uUXNTm4nSesynzhdSp+yGSm83rKKeI=
X-Gm-Gg: Acq92OGUHitGXU07RbLnWpzYz+Dh4QGTTxwuhkxVDWSeJOPByeYkYvRxXq3xB3Bs5S1
	d6iPBAb3R40OhDfJiHtI40OTRYdzwMjTKMoS9seYSZm4YWLLaQ2cs3mnXwxIkPyFpwyPObc8xvg
	5Q41TYhFVDgOyHX0cZ1SFIKcQdtiJZ5H6BgYBABj1OCJqjOtFeMLIiCvxtvkfRNDrRQ8kzGbgPP
	8sPaVJK4C2aWBmdZah2E9Hq6QmNgG+9dVwyYuXcCfUwOrxwpGFy8Jd9qngQXC7t57jzJd6Ky63c
	TdRtcnskeO0WOGkTE4rgqEHhYBQIraAMTg7iMeop0mxe7v/csORK3mpbzi0nDsJdNTBDh7U6goR
	f3p8spfEpgbbPqDYiWxJquNN7SyJXb318ixHgKyBI8ORDozNzQvbL8nsUjrBM6005dhMxfPX0Yp
	fx612qxq+ZNpoBNYOJFQ5R/aAyEpMC0A1UT9ooqCGRblZQCVXE+0xF77eGIQpFxC5kP0vPXY1P3
	KOb0+TrsvTsnm5G/A==
X-Received: by 2002:a05:600c:8209:b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-48fe61f2a2fmr233190475e9.16.1779103807097;
        Mon, 18 May 2026 04:30:07 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:33b7:a835:bc95:259f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c885d5sm228471045e9.5.2026.05.18.04.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:30:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 12:30:05 +0100
Message-Id: <DILRNXCXCO25.B3SAYAFHBU69@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
Cc: "Peter Griffin" <peter.griffin@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org> <20260513-exynos850-acpm-firmware-support-v1-1-3858d097e433@linaro.org> <e91496f2-3b7a-4982-992a-91e8326367be@linaro.org>
In-Reply-To: <e91496f2-3b7a-4982-992a-91e8326367be@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_123009_509347_5471751D 
X-CRM114-Status: UNSURE (   8.78  )
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

On Thu May 14, 2026 at 3:46 PM BST, Tudor Ambarus wrote:
> Hi, Alexey,
>
> Please check sashiko's review from:
> https://sashiko.dev/#/patchset/20260513-exynos850-acpm-firmware-support-v=
1-0-3858d097e433%40linaro.org
>
> does the gs101 pmic constraints apply to e850?

Thanks for the heads-up! Yes, sashiko-bot@kernel.org sends reports and
I received it. The "To:" field there includes lesser email addresses and
only device tree mail list.

I need to check pmic thingy for e850 but probably yes. Obviously, it
needs updating.

Thanks,
Alexey


