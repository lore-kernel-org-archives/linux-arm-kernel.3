Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9837CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 05:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aR+InBDnBjn09cnwllCT+9UwMA0LVX9Wn4YRKaxBLY=; b=nFt5mDDs3viM5fVHsRZ7b77k6M
	a7Bl19Xpk+IarSRRH9otLZqvHoV039nS1hPJLvHukrIHzFmd+PhL6eoRyjEP/51Q/etF+yD7Run93
	79r1a6ES7T10TuCbMl8oLG5XTIHcwOSKiJTVlQ4p+7m90aoA4pB+Ch6bixmFKd2kGYyGVJagSq+VC
	C7hdUurwDM6hY1H1t1vW3wEUnk5tq+P5zRzkZZ5yi162Ic6pJjbAj8b+sgkcXUUJykxdu82wraYoO
	R8vBK6p8iTZvA6dIyKejU6cGD6WfJ4QmxUIa8JUJ/sFqUYakgisYYQ7WEInmZfY2Rtqo5RAA4UFqL
	CNGFOK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v75gi-00000007iEz-2rTH;
	Fri, 10 Oct 2025 05:29:08 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v75gf-00000007iEd-1nfP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 05:29:06 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so3053676a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 22:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760074143; x=1760678943; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8aR+InBDnBjn09cnwllCT+9UwMA0LVX9Wn4YRKaxBLY=;
        b=Gn0iS3A6Hy1oHqLKKrMLJgUvms/kM5LwFltfOOl58tujzltYW+P2xOq7wroUIrgANE
         71GELgy35KCKqMY5fSECQpPeSWsjwlk181dBsF9mwNwLAXjs6z5r3H66POp3Pm2n5Yfl
         W8YlxvEf8zqZzTgL86V+RKO88pHeVh+8LacSEcbN5H1QvqsPOsBgJgyl01gOQuCk4Dvk
         Z61aNwgeQUsfMpzauoMZB/7CBrrn9BqPodaHlijK6qMy65bRsuWQpurvAIpuor8TIiwU
         9UsbgWk/BNY70ybzjeWu0Zzslauy88JYluZX+PqSttSLJhpdMGNtr+Kz8nDhj59aTtNi
         TSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760074143; x=1760678943;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8aR+InBDnBjn09cnwllCT+9UwMA0LVX9Wn4YRKaxBLY=;
        b=eAXsea5t+UVWUzsUVBwh8u+AwFrpzKVbrrl0SNYbxyQPZAWHtEHq1sWvbfLkJfejl6
         MSn5wi3+4zX4wKk12/HnjZfL7t44E7DvWTEzMSiG3EQszWjmfxFQbUXEiCJ+J7rKihBc
         RCKu44a2Eb8EBL9VGXyhhLOudr59bQVatAAgR1PPHM3JdO8kckVM8AYs0jKNMJ65EJsF
         wOM9KeLrQJaGvsdfSpngX6lp4XYsXzmTO07Rqp5TeHuhYio8lcc+gwRUK5Pe9y239qbL
         3i4lufk1FN5HwLeEHXrBRrYNq+X/TbPR6eiloc+tubI+0+vsSCuLA0TIgh1dEHj4EzvG
         hNzw==
X-Forwarded-Encrypted: i=1; AJvYcCUpCpjavOtfaov2OIFsHwh073SpOooUlV4EIyjsjYNPx0t2ATBB/XTL/YvPQneptR932cPF1FtS9CP2l0TRe2UJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyX0SswfsQbGXkn6AzNaSW8qgFOq1qwFbgGeEhkiO8ni7Ru6FN9
	4L/y+fl2DzbxvDRNbafuIQpa4DPVGUviEGMkdb09rbdzj8uqJBRJH7bJ7TY+5qd8g7k=
X-Gm-Gg: ASbGnctO7XJ2NGGycIEsKdYOea+356rZivXgBxNx1OSGFx37EOX4toXFNpFUVl2TOV7
	FCFFEooHMXL+Le3eXJaZlqAtI0EPLekMi1i1tGDCaFw78Eg8pPde5U4lm9s60peJAQviq+v+gzj
	MSqPU5qDoqKWQ43GIVo3lKpd8XXW823u+b3wEA4/hLo3BTxWjJyAfUeqPTpt/ZDnHg2EzzVQVSg
	uxVqxh7jVOopD0fQYH9HrA9OA+JJ9rkEH6wzu5FehBVRYmG0M8kUmF6aXHLTZl2bdpT+Y9rT1r5
	PkfNn59YTA5TJrEXnaDF2shZe3bmxR8mtymPSzILUQQILQbrNFyskw6yE1Api2ppcwGej1a2e4m
	vqvhZG27HCVQy9FXAtzCEtgZbWHk9qvUE4O9zYv67A6wGV5tu
X-Google-Smtp-Source: AGHT+IG0R4w9Z3PlluIRXd9lN4bhh6YAYGuTKxcKQNJqwpna264jwoUI8J+xZkraphoRjdWXanfcWg==
X-Received: by 2002:aa7:c594:0:b0:634:5297:e3b3 with SMTP id 4fb4d7f45d1cf-639d5c79798mr6900276a12.38.1760074142813;
        Thu, 09 Oct 2025 22:29:02 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a461703dbsm1459171a12.0.2025.10.09.22.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 22:29:02 -0700 (PDT)
Message-ID: <a00c61f8c705ace0838ac021489d5300ea95dc21.camel@linaro.org>
Subject: Re: [PATCH 03/10] pmdomain: samsung: use to devm_kstrdup_const() to
 simplify error handling
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Ulf
 Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Date: Fri, 10 Oct 2025 06:29:01 +0100
In-Reply-To: <ee66dca6-3cd6-41d3-82f9-d2673da00287@kernel.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
	 <20251006-gs101-pd-v1-3-f0cb0c01ea7b@linaro.org>
	 <5df18f42-b567-4d27-9e12-29723af40d6e@kernel.org>
	 <9d4ccadf76ccfff1a8b5f572b8aa190e2dc40c29.camel@linaro.org>
	 <63fb3ccc10267add00b579d4a05497cbeeadc65e.camel@linaro.org>
	 <ee66dca6-3cd6-41d3-82f9-d2673da00287@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_222905_485036_96AA8C54 
X-CRM114-Status: GOOD (  17.98  )
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

On Fri, 2025-10-10 at 02:35 +0200, Krzysztof Kozlowski wrote:
> On 09/10/2025 23:00, Andr=C3=A9 Draszik wrote:
> > On Thu, 2025-10-09 at 14:31 +0100, Andr=C3=A9 Draszik wrote:
> > > On Thu, 2025-10-09 at 09:13 +0900, Krzysztof Kozlowski wrote:
> > > > On 07/10/2025 01:43, Andr=C3=A9 Draszik wrote:
> > > > > Convert to using devm_kstrdup_const() so as to simplify cleanup d=
uring
> > > > > error handling.
> > > >=20
> > > >=20
> > > > This is either a fix (then describe the fixed issue and add Fixed t=
ag)
> > > > or you change the logic, not only simplify.
> > > >=20
> > > > Previously on of_genpd_add_provider_simple() the memory was not
> > > > kfree_const. Now it will be.
> > >=20
> > > Indeed it's a fix after all - While the driver doesn't allow unbind,
> >=20
> > Thinking more about it - at this stage, this patch is not a fix. The dr=
iver
> > can not unbind, hence there is no leak to be plugged, hence no fix.
>=20
> It is about error paths. Driver can fail binding.

Thank you Krzysztof for your patience. Yes, I had overlooked that
of_genpd_add_provider_simple() itself can fail. Sorry for
the noise.

Cheers,
Andre'

