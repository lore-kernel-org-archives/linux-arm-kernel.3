Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9929ECD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=; b=e83j00j4zTO2AFNQtjvloPLJoQ
	zpIEMQSolPe+kZCeRUj07/d4kL/TxUKQrPJSKAKG2KXz/ZWxjvJUKDsomkQ8sREmVUbZYFYO4g6lZ
	S4h+3cqmxw93F8tAR10rz07jeyMjvoevFsKDipAnAo77i7NOVRIdgPxx8v2ibTwiJneIOoIjW3Wa2
	XUvWHBkUlhP1YcPSzHiggkYMdQEGA7OXrv42Ee84rlPbBIgKwH7N67i8ifVqHo/fCqqrnR5SZHek9
	XCxrS8p3AB54cLHHeejb4zMas7V4uYozzn58jHZr0NcXpShG+r5jFFypLBr+Zfql1y/rn2XzCTkWL
	dfoeKXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKapP-00000000gqq-0gCP;
	Wed, 06 May 2026 11:54:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKapO-00000000gqD-061s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:54:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so79951065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 04:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778068448; x=1778673248; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=iXWgjYB4a+va20J76VBb2EqzCW9mqQi+5O/DO0ZXTDgLgNDUk3DdrDxYoPEm2fD4Bs
         Proo9C/Of0p9y3DQ1HeDmBK3F632tH8QkhB9SauYtmohQHdAqvSv+4AATHxZb9mQwB+a
         r3uiQ7YzTVia1VJeGQVWjW1SuMgYK/fCRoOz1f3dnw/C2pufzgPAZSbgYQ+HkQpCoDF2
         Mhleb2uPrv9z95S0cA0QvfmVS/0C9juyIfC+H9re7POCF9+JpH0foV6jLZSc4SXxKEED
         u7OmEpcehyR7sz1TmD+44YAv7xsuf3fHl2u3ux3itE0tqXasDsgB38ApfUbgLDFEJZz+
         y4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778068448; x=1778673248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=W6kmj6gxhFPAlobaACqBjUKWdl63IVzOBzSwPd88C+lYhLwDxV1fVhoajMzW3pfwRn
         BWLFlFeXFS58lNhFk6fH5nBRZ+apK9hAo8X95B4M6EiibEeuj7aObMo3MMfv3xg3Wn88
         QQp2xyHFDcXFHJ4QrZsH8TVSstFGwboKyMjO9IG4NEa/smQIA/oik6sNzw1O9FfFof6o
         XFPhgoxeJMDikpDhRwDRxo+ZtFE0hvB+IsO1EXpptn76e/acE5xDkNi/qUoNj8q0eJ/4
         +19D3xRfBPiXbnhXQvDkfnevoDIa6VYybJ0BlwmLyimBB5/lpYpA70BzoiaMBGn1xD9l
         E+SA==
X-Forwarded-Encrypted: i=1; AFNElJ8vq1llyOCuDrUPOsVl7N8YPtdi4UIP2H+xSwteJYv60WvRFdsdVcehCXszAcsmtQ4H+udYCsHTF1MGyRzD3nAO@lists.infradead.org
X-Gm-Message-State: AOJu0YzPzqWwm2KT512R7nQYw6mRZ4c8Dq7q2SthXeJhqZRUpAR/AbNB
	VSLd5AJTG7wQKHiSEVnDQiYcAz78sBNJ2DnkI9TynrOGgRcyvPdMxSfP6htnJELDtzA=
X-Gm-Gg: AeBDies8Sy/wKETbMgZ/2FHTquh/JONOAPNUGF5S8OsRW/Eb+enOvKf33vPeuKxvtze
	efiFmuc2ligh0t3jexsRg9ZNllQJQ/8cYYxGimjIGN4cj22muz36KU3PxE0FIFtR9sYy6tAS1AW
	tEdQ0g3HheExVSLCQaXwieixLaM7nOzyPomY43Osq7HhUd//o8xOPLpxmjX2TK+yal6NAppGMwz
	XJp/uRiFVGwJE76mNfjjs7bNj21bn3Gl8Eg7Ar6sJw+1dTzMByD3iyrEb4FpX6uuKvrxPMb6eXb
	2sbLHz+mNfzTnUE5mikJZFNzLzSQ6vZRyqrugdu4KHijgJlLcbj7ADGDgO/I57uh3+Py+uOMhp6
	O0SXoQ/fibocNSJbxNC/kiOiIIzvBaq4vvKrhFtmYqtRtRfX2AHDIUhmAz0SRprWy2qrG9LaYN6
	bFkYk26ssDWEtt3SYiHe2xi27RXXPWhKh/mY7xpiMbD9s=
X-Received: by 2002:a05:600c:8b8b:b0:48a:97b6:7420 with SMTP id 5b1f17b1804b1-48e51f4143fmr55989735e9.24.1778068448039;
        Wed, 06 May 2026 04:54:08 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530cf964sm29851845e9.1.2026.05.06.04.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:54:07 -0700 (PDT)
Message-ID: <c38cec65-e8fe-45d8-98c2-c86c27dfa6c1@linaro.org>
Date: Wed, 6 May 2026 14:54:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: gs101: Fix missing USI7_USI DIV clock in
 peric0_clk_regs
To: Kuan-Wei Chiu <visitorckw@gmail.com>, peter.griffin@linaro.org,
 krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
 mturquette@baylibre.com, sboyd@kernel.org
Cc: andre.draszik@linaro.org, alim.akhtar@samsung.com,
 semen.protsenko@linaro.org, wllee@google.com, hsuanting@google.com,
 marscheng@google.com, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 visitorckw@google.com
References: <20260505171457.1960837-1-visitorckw@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260505171457.1960837-1-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_045410_077952_9CDB0F8D 
X-CRM114-Status: UNSURE (   4.51  )
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


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

