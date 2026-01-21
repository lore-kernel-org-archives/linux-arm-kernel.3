Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078B1C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRe4h42gYYt55oqZ0VJMAxvd6IK2mO4/T1aM6Skm7C0=; b=nYfGkgYgiXZ52LbsI0CGMD+YOX
	rMJiSAC09uMpgG6OU+vi6yz8HECsCpyoLTzhCUf0tHB0n08kDHloGD6i8i79SJNwzpGXoqO4KBTR3
	MIowFkWSqj7XOTArkLDz6dwSwhUkaoI5IeNV7NquPV9wjxffxGO2KR+sEfYVFwGgDWsjZUKwqAb/Z
	bzbP9ZoPCfWv+ZZ+55sLAql0stObBGmnPnc0RL5u53OqiQQs/F9Y66oyCW6LoGBkHmJYpor1i2+3s
	IPxdoK4DvFKUDjUa5285v0wuIMmr1RRXitszlqLmjNszXG+Fh0DeSGwnljWAKGlKdeZodTdqEOx9j
	317VtTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viahf-00000005lUv-3qd9;
	Wed, 21 Jan 2026 16:05:07 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viahc-00000005lU9-1teR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:05:06 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-385b6e77ef9so3261fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 08:05:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769011499; cv=none;
        d=google.com; s=arc-20240605;
        b=TQAEeQ0Dg/r/sP8uH5upzAMUQ7qgejkgU1UEadZ8mTqDLlcPSZsB7xLBE/0y/xaOuU
         2f0QBg4fV2fx+YgkOCBH5eqj+2jor0J2CmOyWggULFnLgIpGI1jDwnis3mw0q9tnVh07
         Sbfpoxa0/RKeNOXCB/oWuiejEP7N4hlGt63Q5kiL7OMvK3TMvTlcP8P1bN+/WiNzIoVD
         s/7euogQA9VE0V5q7pN5z9s1smtrMk5fb/+06GQYLb0+sGn75yZg5g3J0/JcldaGE97K
         XbOIqOa94Oegj6m1KOdtwYEEgKDMIHSY0rkDSYcWpqsEBeocEadwxHxTqDOAxT1kMK6W
         ibrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRe4h42gYYt55oqZ0VJMAxvd6IK2mO4/T1aM6Skm7C0=;
        fh=GDX530vO+sJS3kwOhQRFe8CLRS4CQjDmxbvXL2AoAp0=;
        b=MwKSKKEhh38cUJzKQXoBOb4c+k8oBrEzWkJoJikig14rTdzoF3QzOoJKTNOoNifMt/
         UYQvtwGBIOHHzRCzn1BtP3KnwvWQ6b831QqLFg/0jpMLSy2hNnpEf2keqGrRJZiNRo/E
         1pulTn5sK+cmGZ6FVvSU6dKOkgWau4/+jT+6V1/PCqOj7MD6gH2rtdFYHH1MGJFb2UzW
         MydDSPW1NtXmNjToXMWiMBQiWxSYB1+FUss4HJzbkceTl5jqTsXfqwLCLEvFdLfzq0rM
         hJ17fNyJeaKrR+yA6WIpWIL+3CALRDZWm8QvZNoIiNehqUe62juInOPUueWiKsHu7D05
         rJeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769011499; x=1769616299; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRe4h42gYYt55oqZ0VJMAxvd6IK2mO4/T1aM6Skm7C0=;
        b=Y6F59H0b5nDVo9j8Y5xgGCVf93dAsPKJSDwZRU9sqzRjCL57Ir0WVMzNu4LELBoyho
         L32DIQM2woQXwraPIoQcRhRAmffQyIZEGRP/BElkhmni06JigpuCucGErO67rE9AcySH
         zVRo25+QcmFXrXAGP0HU9z5p/GuwjigVx03bvYdqYodukTAX2Sd0dxRkJ29O9oOBZ18d
         0A0LUrcYxgoRN0TZl5lrutFNL7QpRvRd3a57kP3dOz93sEmzuTfuYOEpwNVLgt1Hu36I
         LeUe/nZj1T5TfE78HZDJI7gStMHBZBd2MQorLxas0XaI8MtfUVQujA4XrHyXljMX8VB/
         rm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769011499; x=1769616299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aRe4h42gYYt55oqZ0VJMAxvd6IK2mO4/T1aM6Skm7C0=;
        b=UZ/0aejULSq/imX24lOzejCFvDk5nEutN8Bl5T8EUjgJQzzfbf6N7Qu4fh0w6vd7yj
         oau/icluhGVg8bmlm9jxHfKbTh6rAs2KngWDdZPMnmnaR0ZIKGrwhf07iBKdG4Mufmmv
         zsCcjRW61AKJwBoxmN41tmcTL7xQjrnvNdnEGDXjDq1TVTJPvjcMxC6PQugDfAuE8Vag
         PN507nfk3LFXE7WStLMctRFVv4iAus6dp6aXRruS9Yqbo+stJNc5BpgMiCA+Yxy+Guek
         RqQRXWzRRrnlZ/1JFCmEW0UY4WRqVQ1odlPZoow/dc80DiNG7qUkmyjhkxtsyMhzusJO
         msAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRqeoy3pJo+kYovDAmr22DEf12dbo/6F5Jbiq/OvXo+jFFV4EfdUynieVZQZt54q+UjU8E6a3PBSTvL3tJtCSW@lists.infradead.org
X-Gm-Message-State: AOJu0YzSwEvK3Sp/DyUyzZRO/nEliKXqMqqSiDKbmEouzDVR6/iIXX2C
	qWcFxgmdS6GOTb+81vSIw2DlFCVuV1i5BrnBFAnbD/ZTXkLxfsyuuAbA6qT+y/fZqFjKk9eVXN9
	ua0yH8gZ+mVRwQJYhFKaFKVxPiYmuqyc=
X-Gm-Gg: AZuq6aKUS2Imw1/UcX40JjLITDJVlGcjhWHt+a/d0q9Xx2uXuPYI+NlY91J/145xocm
	sj76skW+HPFMWVlNibTH6VzNWWL16vEycKTAqcOkNxsvLQApzKqhq/Mlv8AZREB/SdVwV/jRzhI
	7bP5jjUJClRnsEZsOP8U41MlENx2Ja6SYyAZt2KyC+G4JnGuU+UPOkl0W7uXov8E7m/l7h8+P0R
	uHTeXH4eUpmrt4LDBmfb1ip5LB6cjflg34p0wdf9rOAAG+KYSPG+/Fqf/bOfBIIBstoBoLRomeg
	Y2MD7vfediz28m2LORav1A0e
X-Received: by 2002:a05:651c:50b:b0:378:e079:ecdb with SMTP id
 38308e7fff4ca-38386a5a857mr68389931fa.32.1769011498915; Wed, 21 Jan 2026
 08:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20260121142047.10887-1-shawnguo@kernel.org>
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Jan 2026 13:04:47 -0300
X-Gm-Features: AZwV_Qho2JYpTZVHBYp5J2gwGqRpZGN_LJftzAyI3mmmYjQYuMr8IbSZPCWO69s
Message-ID: <CAOMZO5B7Xp0jXcxmD6zJeT2Q8QV_AiQhC-e3_q2viKNsek09+A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer
To: Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_080504_613982_52BE6C40 
X-CRM114-Status: GOOD (  13.66  )
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

Hi Shawn,

On Wed, Jan 21, 2026 at 11:20=E2=80=AFAM Shawn Guo <shawnguo@kernel.org> wr=
ote:
>
> Shawn is no longer interested in maintaining i.MX platform, and would lik=
e
> to step down.  On the other hand, Frank seems to be the best successor
> for this role.
>
>  - He has been one of the most outstanding contributors to i.MX platform
>    in the recent years.
>
>  - He has been actively working as a co-maintainer reviewing i.MX
>    patches and keep the platform support in good shape.
>
>  - He works for NXP and could be the bridge and coordinator between
>    NXP internal developers and community contributors.
>
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Thanks a lot for your great work over the years!

Thanks to Frank for volunteering to become the new i.MX maintainer:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

