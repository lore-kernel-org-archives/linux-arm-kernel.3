Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC400C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3Ow0xpp1VPcxg35zy2Gpi2FWcle5fD0sYX/EFmyWr4=; b=iozx5wY1AQTbJ8CnmGVovPYVV5
	U8hUazZRxLmQYwUTg8X673msHJR+DFKv5yigK4ELUTnmwGaR0JzPT9VZQpU7XuZwjIIumuVgPz864
	ueTzpE6CxnY+so0yA7f2IKukekuiku04Vz1FeNlZkFmd7elO9WJAn8bHiHVxB6PLqwuzuyyuQX0aV
	Nl5DOX+H02I7XGMnj1JqiitfOK2PEZnJDi4AwO1usM8/eYydJwUb+S3wNorS+8XJTU6BnVvu2v/SM
	ja5c//6v7Peq22TW2Hh1ElKn+a2CPkFRVpTvGWk4zu4to7myHx/riN+o7Fc0Zyv90IATP5P3Maz0v
	wN9ImHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53zu-0000000HCHN-2ZPq;
	Fri, 11 Sep 2026 16:21:06 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53zp-0000000HCGS-0c43
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:21:04 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c29432715d2so198027666b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789143659; x=1789748459; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t3Ow0xpp1VPcxg35zy2Gpi2FWcle5fD0sYX/EFmyWr4=;
        b=Mn2pi1c7XVTByXVTvJ1D+Z1LWCoW/PfxFOlXOjyb0aS08BbvfF4N7/IuNC78W0Kths
         7oIvdOJjRd2B30rSrgyrErHD+34cEj3B6zCPjFs750qteBXLi06jp3sD733KGqKBaFkf
         KFqD7ZDdUjQAJWZr0sI0Fbws+G4iS9+BEJRJ1C1wNfxw9+vsMZDXxC2SH8Bw1K6VOv3m
         SrCjLchDUT0aNNSSSpKYsXHIgsaoMTHd80MK7TfAvTFBsc+yjvA2QCkFwXQIIcwPFlq6
         WMlE0AGDnLZl6+h8aJfnH+pK+inYtkm/Qk8yBnjOtkaEtALqCK/0ZUAfN/ZrQzDC3eKU
         IjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143659; x=1789748459;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3Ow0xpp1VPcxg35zy2Gpi2FWcle5fD0sYX/EFmyWr4=;
        b=SMOMZeAGg2AC75zfyu41gS4uUtU+2F3rCTeoxZryhYxdmtPgu/RaFnwy8YYr+8dUpK
         R4GOBHY3X+4ZJpDCzOvt8+Kvpjk5O54geZUB6tac1T7Sr2T4b833YfR1ZLkRWM3rDGI1
         uM4ubvGQlyJa5jTHzU22WHhjVhkmj+Hl2rceaKbpYEpN8pIADOVXDP3ZkM3eULqLBA9Z
         9DkK44ivG1QNne8T6D8ZAA2VCU5maSHteUIMWGoI0hELs1Q+64qbUc/VdsQIY4hSJjC0
         w4XZHkcjrkmPlxwbD+oBFoKmizqi2Z05oaLnOg6XBdyeJ/Ihq6smahMG6D9r19dZkvrv
         nfAg==
X-Forwarded-Encrypted: i=1; AKwUvBy4fJLrDA7/KEZc6BNOa0URwhXvlodSYlegSgfv84JyZOlVdIFwASpzFfkbB7donFYgMgd06H386Z6g6FZrlG5q@lists.infradead.org
X-Gm-Message-State: AFuF++l0HWXvRrVWFkN80tcprjumuMSKO9HEtMaINppIMyd8nZDNf2Cs
	UXPqO+JL8QPobSkL51/Ump6snV3L+ll2LKdr0zXkvvtD+jUuE6FHZSZ2uAK+Vvv+Oec=
X-Gm-Gg: AYBFou0B1epvu8NzC3QSViymMl+hEPRuCeT5HuzgYFcq+4p02phfHY9ynAA+Jmc0eTy
	SdVleZbP77bS2R4oOxHnxqbrXxS4fO+AdcaZLxjnSZf+EnbxIylGgMt3jd6P53WgFrIzyd5Itxw
	rulOZIhCmsVo/ISCAUr0xZ7jCrqdiueuTLyL9lEHCVrfgqFNHHqUhhSpakqTaoFptfUwAKudfI9
	pt2GdQnUu8e7azKSqIwUr2OHc7DeoNeIjnmAhMdTIpRU06/LOA1fznPGS0SPMdwptB2szNmdtCK
	J/Rg1zT44XlrVe6acGFhqo/BUR0mmH+WnSodRpwbX2l3LNnf1p/Py3sYwrJYVgsdvEl2SUrKj/l
	9anSO/vYnBz2T24m0ZXnfGKkitDQogvzGjFdbQunX7EsXTD7JbiKaiwkYB3gWCLuug/zl+Q6W1e
	A82yBTrIEGwxqrZ5EyffpMi5/19ARETvTo69QBF6GgZxXXBzm06Dtj8IgsikHSy2Da5NEj/5fEY
	yiZZxvgEoCHyZ1ImlR8U13HT4WZUqr/r9+o6hUdPfxFNWfnzkQTK4OiqpTg
X-Received: by 2002:a17:907:5c9:b0:c26:1691:b36d with SMTP id a640c23a62f3a-c2966a6e21fmr221558666b.38.1789143659129;
        Fri, 11 Sep 2026 09:20:59 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e248sm109763966b.2.2026.09.11.09.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:20:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 17:20:57 +0100
Message-Id: <DLCMHTJ9SYL0.3HW3W6N3PFYWM@linaro.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Peter Griffin" <peter.griffin@linaro.org>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
 <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
 <CAPLW+4ntx8qLy9jAYYdT+XwxwKHjvisutqEi04oPEQny8auD-Q@mail.gmail.com>
In-Reply-To: <CAPLW+4ntx8qLy9jAYYdT+XwxwKHjvisutqEi04oPEQny8auD-Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_092101_210328_AA19F58D 
X-CRM114-Status: GOOD (  21.48  )
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

On Fri Sep 11, 2026 at 1:42 AM BST, Sam Protsenko wrote:
> On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@lina=
ro.org> wrote:
>>
>> Document "samsung,exynos850-acpm-sram" which represents an SRAM region u=
sed
>> for ACPM communication on Samsung-based SoCs.
>>
>> The SRAM is consumed as a whole, is not split up using child nodes and
>> properties related to this are not required.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Document=
ation/devicetree/bindings/sram/sram.yaml
>> index b83fc6831947..b9c4d4f3199b 100644
>> --- a/Documentation/devicetree/bindings/sram/sram.yaml
>> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
>> @@ -43,6 +43,7 @@ properties:
>>          - qcom,rpm-msg-ram
>>          - qcom,shikra-imem
>>          - rockchip,rk3288-pmu-sram
>> +        - samsung,exynos850-acpm-sram
>
> Is there a reason we can't just use "mmio-sram" for Exynos850 ACPM
> needs? I can see it's used in the gs101 device tree like this. If
> there is a reason for this, I think it might be a good idea to
> document it in the commit message (probably in both patches).

But isn't it already in this commit message?
"The SRAM is consumed as a whole, is not split up using child nodes and
properties related to this are not required."

Also: https://lore.kernel.org/all/5797be19-8886-45a2-bfce-eb7d5f0df6c2@lina=
ro.org/

Do you want it to be re-phrased smth like this:
"OSPM ACPM should parse the SRAM and discover essential data (e.g. queue
offsets) for establishing ACPM communication. At this point it is not
expected for any software entities apart ACPM to use SRAM so the SRAM is
consumed as a whole, is not split up using child nodes and properties
related to this are not required."

or

"The OSPM/ACPM IPC should parse the SRAM at runtime to find configuration
data (e.g., queue offsets). Because this SRAM region is dedicated
exclusively to ACPM IPC communication and is not shared with other
software entities, it is represented as a monolithic SRAM block without
requiring sub-node partitioning."

?

I hope if there will be other software entities then we will be able to
fix it later.

>Also,
> should "mmio-sram" be added as a backup option (after comma) in your
> [PATCH 2/2]?

Sure, I can add "mmio-sram".
The compatible =3D "rockchip,rk3288-pmu-sram", "mmio-sram"
and compatible =3D "qcom,rpm-msg-ram", "mmio-sram" are used in such way.

Best regards,
Alexey

