Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF31C47BC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ng1O6r3g3fw5/a6Cbf+5U6aFI9SGtJM1t6RTyf6QqZ0=; b=vgiBgq6auHLEELYgSw/VFeTpVT
	/mDVJs3dst4oGVPi2tnzyP14sjcnHOsEfV8oyFwooz4nXQvvqV9QjPmk6x25sMH/V7EloSjgymcDs
	n42EB+KrYS4lulnalWMNtnHPnH4anPZ4DjPSAsXUaHX2rGzZAV7fDVbM2E+eXtI5N3R6K7pTU4dKD
	S9QuVmrQ3vVAQ4zLC8iB7udQkFrQo0vRGtGM9R3VkEhR0iHEArkdToVmEoX6bdziIv2ie1aKe246/
	hlvU0utzXkHGdHo50pasCFuxcWyCB1NsILoNAlZ5RaKSvE4sh86zL1/cTpYUNhdHfmLIGbe4XqCIT
	okc6whtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd32p-0000000CfWc-1p0E;
	Tue, 06 Jan 2026 09:08:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd32m-0000000CfV3-0ETJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:08:01 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a3e89aa5d0so700675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767690479; x=1768295279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ng1O6r3g3fw5/a6Cbf+5U6aFI9SGtJM1t6RTyf6QqZ0=;
        b=dZTdZWh470BylIel35V8rLay2NzQr6DKj3iahrnItFj/krK0bDZUWVwcrREJorM2mQ
         lNi5/pkkpnXIl5/dUDJaGZCUxRFqNLHIMXZ9ILHdFjA3lbK2SJMV6O27RvHezpyC0/hA
         sUFx7zZqPBQskIZlOpV9BKAYiab3z/xboxenWKSzNulPNr6cKvNYmAlZ64XXyjgdVm4R
         DhZmoRQOaFzPOQMwBGJa03gD8BNy8u++21x+SruR7VANGKv9QlaldsNeNKpjACUtz4LM
         wNigVoY2TgvCnuWkmEWGPmfbabifF0JMAjlUkh8ZyXjVCcl3bMXhpqII88hhYAaQ2qj3
         ugAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690479; x=1768295279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ng1O6r3g3fw5/a6Cbf+5U6aFI9SGtJM1t6RTyf6QqZ0=;
        b=CuQijiJZlcQYukoravbbOu0/5IpVnkIviMvmV+t1JxJ8j6ZBtnR5JO+P2Fe2f1Nv8T
         2QR8e1rTtcbaIrF8V6hyOqK0htHwzZNW6Z4Dscb/2QptqiKC8zimQamnFVz3Z0GLlbKi
         mz0I1IMrMGlzCjtfYmxXLHJSjI9z4DSlhkG1Rk6MQ5OS/3vsOaJSabb4J4HpUco+sk6h
         o89UrQKcJgaQhU3M3NbQ9vHkzXtE4zk87eZsodc6w6Uz17iTrWCrNLvUAX+k6XjXUGyZ
         F/QoybY6/JBatXjZHvFYCluJHMwgV0DyxDYXULkli2mWudHoVD1Nj5mjMRucYlx2ynAj
         rW1A==
X-Gm-Message-State: AOJu0Yw1X96ZK+WTEi/9mfVlTZ+kny+b5v2vXs+9tPws19b1TknxHm+8
	txbVwD1qAlKtwq/0wp5jmKu/2I8NwICm6PCpirgXhIVWtoqA3l82fCfTiPkLfZzuN3ShlYcmivt
	hoOjRfj4yae2So8tQ8fCEgLGchVnqdKU=
X-Gm-Gg: AY/fxX4ZUg1W3X27HjPAnu1OfhFh7yTnLq/PSrX6alXQqGrJMnVbXfvDzP5zcuFYwtH
	1O+1Yd6cDHBd+XFnjCu+GsyTou8JuQ2KVQ9Utaj/B7PK6uJl4y5RZnxWtt2EiLKAPiPMJ1qkpQc
	WKGKZ0sWjOY5MCXx0A0HV8BSHgoQPkxkonIaCUsnczuk90rj1verkxMR2oDp9LctGnk0PU7z/rj
	9NatPzMuUP/F43RVqUzTcXV/TXNezjrMl8gTOZyBJc+IPW+Bb1aJraafOk5lvuTp0pVrohSWWjO
	0f2/uFcq9tHeetevXBspvarONCg=
X-Google-Smtp-Source: AGHT+IGvgGC1dgkt7wuMnmSCuPWWqlGjRV0GwcsdQ/Sq5EQ7QxT7kYX/RKSYc+hqxzm3Sblq3B8Wpb0Bsh7gDiAoQ0w=
X-Received: by 2002:a17:903:b10:b0:2a0:8966:7c9a with SMTP id
 d9443c01a7336-2a3e2df5419mr19705135ad.58.1767690479185; Tue, 06 Jan 2026
 01:07:59 -0800 (PST)
MIME-Version: 1.0
References: <20251108211503.1578711-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20251108211503.1578711-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 10:07:48 +0100
X-Gm-Features: AQt7F2q3nwKPMxa1oOETiD35RsxTmLu3g29Iap0HmNIWj-OuXkkF_dQhuThhVVg
Message-ID: <CAFBinCDQojLyznKTxn+fGgq21Wd+eFFjTPc=a8Dw+xMnwy1S2A@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: meson: drop iio-hwmon in favour of generic-adc-thermal
To: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_010800_090866_735E1458 
X-CRM114-Status: GOOD (  11.51  )
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

Hi Neil,

On Sat, Nov 8, 2025 at 10:15=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Commit 85b21fdec906e ("thermal/drivers/generic-adc: Register thermal
> zones as hwmon sensors") made "generic-adc-thermal" also register hwmon
> attributes. That means we now have the temperature sensor shown twice:
> - once from iio-hwmon
> - and another time from generic-adc-thermal
>
> We need the latter for SoC temperature control, so simply drop the
> former so userspace doesn't see duplicate sensors. Also
> generic-adc-thermal provides a better name to userspace
> ("soc_thermal-virtual-0") than iio_hwmon.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
gentle ping on this

