Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C6EC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=; b=tIfTXxOOVNKJa8KEfDfO2AS3R0
	qsEenQ+QTnMXXZhQvzhkVPhvFjZ2KtOSbLB/RyBkkfqvQ31CDFT9jE1JTgMvYn6RgX45qFEAGath2
	Niy2dS/+eLtvlX5znHzgwi+v2Ywgac15rDmpyV8i+MSaz1+pA/vINAzdCCJxR84prMXvcjigiLHDa
	osR2BdrE5rGNt75tZWJl4WiD2e8DfZ1BbL/vjXOyIYQ7gvOAIqcd0dus9xEsyXQ9037sTU7srOHFH
	jrwwv+adIf+/tl4+gLRHgoVneQ3Cstoyd5Eh/yE9jQSd5ffk2uWDJL6xeLmenFCodG1QvrasKj3oY
	yvzlBYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FLA-0000000C07N-1rOf;
	Thu, 17 Sep 2026 16:52:04 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FL7-0000000C06A-00Ev
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 16:52:02 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so1962255a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 09:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663918; cv=none;
        d=google.com; s=arc-20260327;
        b=JJNWOAE34UgKmB9wi4FWdd2+ZoN0XfJccLPy7HYInvjw52CJnID8/zayhS9sX1V2Yy
         NvWtPyRkUzzlEU15ojqIVMhtrl3wRnkKdFvduzQGo0CzR2876A7F2usXeKSb/Z6LEc3S
         9ZQSYpmlKKbIJFuqXif0Zlz5kR58dRPUHip5GZQ4ApO0mnvHsVVR0znRtUK9uHQBtZBt
         KYMKALYI6SnRDLQKQP60X63MREfafgZfbOQvK0jqLRQ1GA9ca2LpCHwmNq8YOQqKdX2O
         rAZUV2dslU2Gsqm1luSVDrcb333u0PqZe+5U4474vvquSLKtZFPCegf8eLTxz0aphewt
         ecVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        fh=5gDA5R7QyJuKhy+34+M8coCdx8u2ndo4WZT70KYyfT8=;
        b=Xh7KnSdj6Ex/26wzo6ovOjHQgQo+7PApJNqvXSWVAaA4SRVF8sUJ42MsswE3PSdTLH
         nuG4tQlXnrA7waMI5PzUFcntjseERsNH6BlD/qrmGI0p9M+Tr7n28HOUE3R4L/B/f4le
         lJHAFDIKMSBWARS7kQ7JKMutEj5b6KAFOF5POV5K9XhGlahNre1auDOXNvlLMdKxvZ7Z
         HWj5uNSO1MCromRwukAEz0ThmGLnbYAe2BkUHvxWduAoGf3ecSVvwfjZfu/MmWGmQ1l0
         VFYvvWr1ltMJzH1dlHR//YAiokUh9vMa9+Au4df1IYq1uu7KivHYFTy5SXodO2O0khQa
         f28g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789663918; x=1790268718; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        b=T5NHSSY7l6N49Mhkw7l6l2HjwJblI+KHdhpd0CKamUcYuUOel40ynF3Xi0JELmOyMg
         wdJTrJDUCNCWycSVUDZREk2XCMd1SvC7yLkKLukX8oiecX+hZvtJNOKnT3Y4l3ka7Y3T
         GUchpwnC1looowb75FLw9kWE/d5mJGM+Z6y9l06Ut68aVrdSdgTBE1w4Sf8MCQZL2D8g
         X/hiWDfyEIVuIGOSMJflucVhoVyGfnjcXUhIOHC1q2hlUs0fYMm+lcSDFJD+bznSA0Ok
         1w/cIJ1h8lNknj9qiwiARZjimuVD2GHaIGeVpVQgqas3Gh4QNMttxnv/QYop1SCZEdnd
         NCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663918; x=1790268718;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        b=RYjH3wyl6OrBeoOgW5/VTFsmoLbJwh2mR4wymMIuqo1MbOhTbMHHa5VjdufXNa+rvb
         F2TKJbg4W68b2Frqxd4nUHgMLyOAayYi98wsjIOL8Z/kbKaPQTo+QjSGxtrOebw5B4Zg
         8y0kTVRkwH9FZl4zWgFSYYi/qGQzm1mYjrexsEtrs92jzRRCJxf51Jme4x5mkcGx+Tqo
         M6ymGqjvx4qu1egyGQALLfmZvEfoz+d0ZnSgKnDxlCxn/IQnucwoANTkO24KCVwzSSIK
         SRebLpY/sa7bkyAc4c3yPVkM6z9zbSDztjyYsEw3N7Feft2u6BGOlZeT9957P1C20Nlu
         mZOg==
X-Forwarded-Encrypted: i=1; AKwUvBzg5HuCZtaqJyO0RglUha3pBsnwzoKpKsqCFLJDh/4LCJ64rIgFs12cukT8hjRic//sRZ+3WOiymvLVmbBrcE1J@lists.infradead.org
X-Gm-Message-State: AFuF++k23WFokf7Ya3hiDazlgGXIlOtJin0MsYcD2ZxhUp4Cd2NIeb3e
	X0vZywp5k2hwirEpo7Y6qAHhmkw8nbCrkRdVlBLLgEzOxJbzxruA9HAAv0aRCl/flG4H+idrQbY
	vTz+Le1IktT3fha26wIp7LUjHfinBr1Y=
X-Gm-Gg: AYBFou1BYHbBCPpFpKVZkuAM6IkOsO0vsZqnhNAjV+wCnoimCVFVJAk/fhiLuBU2Xy7
	FkV8LxEkpT0xdVKJKbyjRRsGOZhFri7R74B8b2UyHMXNB3EfM8Hz8AH9ihoH149EcMPNbgCjeoy
	yCUsldVQkfPdyA8mleKhmJAxyiDx2p2eUt0+dHdfVaWVK/ykrqVRPb3vD4gg7jyQaCkasfX64G8
	uj+4sDCpC4Gg4jBRUJj35I+L7+ILzHDLNIOAfLp1ey+6l5CKiN+6MyybxDJpswU/1kKYCRcULHk
	Tm9S4CJyDo8N+Zl2A+XmoN2HBz8eFcb7px71U5nDnNU+pOSByFHPsg8=
X-Received: by 2002:a05:6402:3789:b0:6a9:98de:6d8d with SMTP id
 4fb4d7f45d1cf-6aa2245fd0fmr5568315a12.45.1789663918221; Thu, 17 Sep 2026
 09:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260902193351.185771-1-l.scorcia@gmail.com> <20260917143459.GA2348773@google.com>
In-Reply-To: <20260917143459.GA2348773@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 17 Sep 2026 18:51:47 +0200
X-Gm-Features: AcwNN1UCLyUlHms-nbsVMpe5KcLakQ0vi0ozu7P9tcFuOM-WKvxcQ6ubbojqdxA
Message-ID: <CAORyz2+rT-oNJtWc5BRDrpUjBPVbO6A=qrX_K+J7fAR5Ebm_3Q@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Julien Massot <julien.massot@collabora.com>, 
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_095201_054830_79EE7D3B 
X-CRM114-Status: UNSURE (   9.95  )
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

> Still waiting on Acks by the looks of things?

Unfortunately yes. Patch 4/9 [1] was suggested by you in [2] and it's
independent from the rest of the series; it could be merged without
introducing functional changes, but I don't know if you can provide
the Ack for it or if a specific maintainer has to provide that.

[1] https://lore.kernel.org/linux-mediatek/20260902193351.185771-5-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260520150014.GF2767592@google.com/

Thank you
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

