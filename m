Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E86CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tn3Avk5AvmztUGNnWXF/nJAfWJJ1CXyUYLany5OsKJs=; b=M6rappzxg/9oIya38eewa6DYGr
	6Z2RlYbETdAANASalxCebrvKpERsWmMZIKAu4EOMWUOMu81X4VfKWMLYTkN5gDINeYzYuccDffeSX
	eOImaKzBzCmA4Q6Oaz+rLKxlSdVHfBNwCNrs7FqPT8+tnYSzDCAW5G921RasbxetPBSZ1kDbmLhfn
	VfU5ImwP2nYq6vA5HdRTX2ugZnNuwWX4yB428WHnfohcopcXKb+FklNxa44nfLxlXXFRwEXIbRWMh
	KFRbFVIGgsX6gqwptVldHpWM1FaMEo9Xt+ixDf8lqDclKng3b6ChCtvOlzxuTpFJadO/ZuQbuBuTi
	6wa20dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3EPh-00000002bTr-2Af2;
	Mon, 29 Sep 2025 13:59:37 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3EPe-00000002bSw-2Jyy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 13:59:35 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3635bd94f3eso43647381fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 06:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759154372; x=1759759172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tn3Avk5AvmztUGNnWXF/nJAfWJJ1CXyUYLany5OsKJs=;
        b=CQxJTypo/HLtpWAM9xKTkKHkVhGha4QsjRi+RD+Z9EciyBv5IiYQVhRxja+LLJeqfD
         sFl2YK44jT+8be+QfAluMsfr9AUDS3nkiV7DHecO1VE59MZh9JIwyX+nYTVMzc2JV3NC
         vgf6aws6MJ5iDY/QwrUfwyXFobEaZpflrUH9kCTkGZDRQiviRZWb9DwH+uJW8IPTBhGY
         Uk7GLNCtbgyOdRs4hv0eIh6GRmdrxqLJAfextBnoXx5VyllbBrVc2ANO2igJXya0VmbF
         OnMZXaiDyBOo2QiLuXr6oryUWj71mrq+6fgP2Ydpi6q2k9aSG6NQOy8lxHOn10t1m1lE
         6AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759154372; x=1759759172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tn3Avk5AvmztUGNnWXF/nJAfWJJ1CXyUYLany5OsKJs=;
        b=AgxEdd+VYr/3wD2y7aVkfnHzuVhn683ZA/UBewIiZnPZnNt8TB8PiGqOk0lrDfcdaR
         ThGsnC8AXibc5nh3r+06zNJ4rlRBCnTYZE5IxnhkzZPTlWqpDVnRHH//nXNuhFVHl0wm
         zdjlyCM4U/AJAl0m2oShQYwS6PAgpPIRKW8mdU6QfLxy8kERJoa9TXwyfp09mu9CRAB/
         htEUu3XvR9QtQJkGu/dDRpCbV3Kr6oM6foSY2dgJLSYU9tEHvMEiHfD99exBS6z4E0dp
         ozT6lAIIqk46BenvIN6+uLvlQlJvHtzZxYp7xV7I6qtizDIn/52YswW7noTQjsv8AJPm
         Uw4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVy9kUha61GdUKfSeVdUKcjHsJ4FbEIHNj2eHv25Y3IIZvt8RQMkWOM6UY13GyAFw2zCg7T1Rqyu8TG68wj2x0b@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6gT1MBSQIg9hBZtGrcKbxUAaxcF5vintyZoEmF+ofmKo8deir
	w6DJxn7SfJmkhvdZQ20UTWxEKtML8MoS9C+Q0MGtq5/NHoHauos0bZvATm+w6bAdyVqoSprQKt+
	FsMWT/x5rsP9yfCMMdiyb7o/ykI0KhoMxwuf4
X-Gm-Gg: ASbGnctOCIa44qbuSuOOna/7/OICdcThSJsdsdwmY8KQj8dmlYqKDRuNcPGJGeI3Zmb
	uwjcaCszgsmTeSN30lvjJohR9f4W0UWzZdyTxi3P0V0fS80GmQ8eCwhmhRaF1mxl0dYtLzghwLU
	gjsWdBZxeJPEmiXTvS4i9oaDr4N2rrGMOYcjNVQG3mCIb4PLxW8S+zls/AwPQ6+WIliPVr5S7Yc
	8pGXQ3R
X-Google-Smtp-Source: AGHT+IFQMc2ZhC+qB5qBNTFzlSmGZTbZSbdvhysvapOami6uME9wqlRM7n01iOstIURuUcWOOB3dn1XgG0MQDMDVEy8=
X-Received: by 2002:a2e:be8b:0:b0:36e:9e8f:ba4d with SMTP id
 38308e7fff4ca-36f7dda318cmr45418311fa.14.1759154371959; Mon, 29 Sep 2025
 06:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250929131422.525315-1-a.shimko.dev@gmail.com> <20250929131422.525315-2-a.shimko.dev@gmail.com>
In-Reply-To: <20250929131422.525315-2-a.shimko.dev@gmail.com>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Mon, 29 Sep 2025 16:59:20 +0300
X-Gm-Features: AS18NWCKpFCfKaruIKOnLjxXbmRphQr18T_eSaDDwQi8eODN-NG1hz7yNExfCRg
Message-ID: <CAOPX744ZGubWevHs53xT_WrbUGVbmSDU4-zuPebqJ9tpng+C0A@mail.gmail.com>
Subject: Re: [PATCH 1/1] rivers: scmi: Add completion timeout handling for raw
 mode transfers
To: Artem Shimko <artyom.shimko@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_065934_610199_319AAA86 
X-CRM114-Status: GOOD (  20.60  )
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

Hello maintainers and reviewers,

Sorry, these patches were sent in error. Please disregard them.

Thank you for your consideration.
Best regards,
Artem Shimko


On Mon, Sep 29, 2025 at 4:14=E2=80=AFPM Artem Shimko <artyom.shimko@gmail.c=
om> wrote:
>
> Fix race conditions in SCMI raw mode implementation by adding proper
> completion timeout handling. Multiple tests in the SCMI test suite
> were failing due to early clearing of SCMI_XFER_FLAG_IS_RAW flag in
> scmi_xfer_raw_put() function.
>
> The root cause:
> Tests were failing on poll() system calls with this condition:
>     if (!raw || (idx =3D=3D SCMI_RAW_REPLY_QUEUE && !SCMI_XFER_IS_RAW(xfe=
r)))
>         return;
>
> The SCMI_XFER_FLAG_IS_RAW flag was being cleared prematurely before
> the transfer completion was properly acknowledged, causing the poll
> to return on timeout and tests to fail.
>
> =D0=A1hanges implemented:
> 1. Add completion wait with timeout in  scmi_xfer_raw_worker()
> 2. Signal completion in scmi_raw_message_report()
>
> This ensures:
> - Proper synchronization between transfer completion and flag clearing
> - Prevention of indefinite blocking with timeout safety mechanism
> - Stable test execution by maintaining correct flag states
>
> arm scmi tests: https://gitlab.arm.com/tests/scmi-tests/-/releases
>
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> ---
>  drivers/firmware/arm_scmi/raw_mode.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_=
scmi/raw_mode.c
> index 73db5492ab44..fb83beb42e7b 100644
> --- a/drivers/firmware/arm_scmi/raw_mode.c
> +++ b/drivers/firmware/arm_scmi/raw_mode.c
> @@ -468,6 +468,12 @@ static void scmi_xfer_raw_worker(struct work_struct =
*work)
>
>                 ret =3D scmi_xfer_raw_wait_for_message_response(cinfo, xf=
er,
>                                                               timeout_ms)=
;
> +               if (!ret)
> +                       if (!wait_for_completion_timeout(&xfer->done, tim=
eout_ms))
> +                               dev_err(dev,
> +                                       "timed out in RAW resp - HDR:%08X=
\n",
> +                                       pack_scmi_header(&xfer->hdr));
> +
>                 if (!ret && xfer->hdr.status)
>                         ret =3D scmi_to_linux_errno(xfer->hdr.status);
>
> @@ -1381,6 +1387,8 @@ void scmi_raw_message_report(void *r, struct scmi_x=
fer *xfer,
>         if (!raw || (idx =3D=3D SCMI_RAW_REPLY_QUEUE && !SCMI_XFER_IS_RAW=
(xfer)))
>                 return;
>
> +       complete(&xfer->done);
> +
>         dev =3D raw->handle->dev;
>         q =3D scmi_raw_queue_select(raw, idx,
>                                   SCMI_XFER_IS_CHAN_SET(xfer) ? chan_id :=
 0);
> --
> 2.43.0
>

