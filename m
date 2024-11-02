Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD57E67800
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 14:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3OMGiouzrJ8irZX2X/fJQXvldwhLjCzScMS8OtJ3x8=; b=1RJfRmeg9dSYA7znG7qezsjfGm
	xTrRV+PLwMAhvYrRKwINArb9GA75ekAj9t4pecXQvh1wqSQTDaAFs8iH38Ir7iH8GVxETu5S4NIaR
	5LkGFdPWU/bftCSHmeRCTuIvYM2Y+UhNrMvVLafLBO00ll3LC7sPkUXWRi21RnoJ4f/MRd6qqcjhl
	/Er1MuojqJNEs9vRMLuHpjikBmF3O9gUyRmBOOipUQKygKyhigABw062syONGt4BGbAako3ad2Qfk
	LeF3AbhRgcXrBJTALmXb/u4qpQi/pI05LLUeomBnWYl8FlXgTB0XUSnnBQz/BbJDwwTEF+QaWGf6k
	CqDLLfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7FAD-00000009rOz-2j7N;
	Sat, 02 Nov 2024 14:31:41 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7F8W-00000009rFG-1i9K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 14:29:58 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a9e44654ae3so341221966b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 07:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730557794; x=1731162594; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3OMGiouzrJ8irZX2X/fJQXvldwhLjCzScMS8OtJ3x8=;
        b=v/J838hegUfijImw4fdQJSRa6jkK0Y66kNnAaHnw4AZFczY1A9LWsYWYwgt7+vaM3S
         B6Y8MtFN0z3XeKOynzjx2nnIOvSBOE880J5V2lKvgB1zx9RhgRQKC5DSn5LfZhUvOcbr
         CyKW1wDnl48rWWV30LnQVv5KA7l17hKJjc1s3MmFCoutrb3lqyBdzabGc6QH77RahO3/
         czeZZoFzRH82R4Gkj8gAHGyJy6F6FNSeQN8FFhGa9Y1gUxsF8Ul4sP5ux4TJKUdqh38v
         o3i+1CMisp72LqvUHGzSGWjc+Pokq4uPo0WIWooJul9SlpxRdsRXc9GrYw2MhrGciOHn
         27/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730557794; x=1731162594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3OMGiouzrJ8irZX2X/fJQXvldwhLjCzScMS8OtJ3x8=;
        b=h3xEiipiQBxnshty5cBTw5apk+ucN2jexKB8/+3qFq1kVDe2TufhczSsgLMcdlNXMX
         Islp6tVHWXUBJbj/mm53iIOa4+j5cacA8KnYzUY7vRoy2vnRpY6a3TCLcyKtTUgiD9vH
         4Zbk8UGSC0RjnBLFZ/a8FyjkPq5AsYQGeKbMbpUiWIuVHSFrVmwaXmMLZM5zWics9q2z
         vUet6QAbcBZN2rYWMKWH3iNRzAWDm4cQc1twfr7T+OewT0T6bbmBX/wo4B6peULqs6sC
         qyOlc25pNlpp0ri/FkcVDgKCwmxMhfi/iobIOV0g/AXl4N7KgqZd2uSL6/R1xtkm7E5b
         zbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcNJPeaHC8k2bCpvoLksV3qZi+ulmJg23z5woxU4CdCk+D3WJlyk0RVSVqEG488D/0/hxdLVyiZYY4Rs5JZn8i@lists.infradead.org
X-Gm-Message-State: AOJu0YwdaOhFMqWOaBDMmxHOVCg/ME1MTl9VSNWQ/fUt+yHIAGAWarLD
	niNZP/FzZjW1YHs0F+WWcAdE/0eqwDlhBcS500u0qBED6lwBd4lrVVaapETH61tuigtodfwTCGc
	9chIRsaTwmtmOsqVnQ9aiIIQY4Dde3srpX8wJwA==
X-Google-Smtp-Source: AGHT+IHmMaoPuHCX8oqUiJ2GAJojyzCvnKuAF650y2r5dVCpByhVut9O1RRSbUZGBDSt5PzipQLZjWLX9kkXAj3eKcA=
X-Received: by 2002:a17:907:94d0:b0:a9a:cf84:2e4b with SMTP id
 a640c23a62f3a-a9e50915893mr967262166b.25.1730557794334; Sat, 02 Nov 2024
 07:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
 <20241031-iio-fix-write-event-config-signature-v2-13-2bcacbb517a2@baylibre.com>
 <20241101164118.687be624@jic23-huawei> <4e4e5281-d489-42b5-b358-c44958cfa4f9@tweaklogic.com>
In-Reply-To: <4e4e5281-d489-42b5-b358-c44958cfa4f9@tweaklogic.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Sat, 2 Nov 2024 15:29:35 +0100
Message-ID: <CAEHHSva6+Br9rXE9n0wqXuwQqetXN=Ae5vg0rxmPRfCVdw9atA@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] iio: light: apds9306: simplifies if branch in apds9306_write_event_config
To: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Mudit Sharma <muditsharma.info@gmail.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Ramona Gradinariu <ramona.gradinariu@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Dan Robertson <dan@dlrobertson.com>, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	Matteo Martelli <matteomartelli3@gmail.com>, 
	Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, Michal Simek <michal.simek@amd.com>, 
	Mariel Tinaco <Mariel.Tinaco@analog.com>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_072956_734473_27A2BD89 
X-CRM114-Status: GOOD (  20.86  )
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

Le sam. 2 nov. 2024 =C3=A0 14:21, Subhajit Ghosh
<subhajit.ghosh@tweaklogic.com> a =C3=A9crit :
>
> On 2/11/24 03:11, Jonathan Cameron wrote:
> > On Thu, 31 Oct 2024 16:27:08 +0100
> > Julien Stephan <jstephan@baylibre.com> wrote:
> >
> >> Simplifies the regmap_wite if branch in apds9306_write_event_config.
> > Applied.
> >>
> >> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> >> ---
> >>   drivers/iio/light/apds9306.c | 5 +----
> >>   1 file changed, 1 insertion(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306=
.c
> >> index 8adc74040db2bddf93fbb773e3519abcc726b9a6..9c08e7c3ad0c17519689a6=
30d42fe9b90438dfe8 100644
> >> --- a/drivers/iio/light/apds9306.c
> >> +++ b/drivers/iio/light/apds9306.c
> >> @@ -1125,10 +1125,7 @@ static int apds9306_write_event_config(struct i=
io_dev *indio_dev,
> >>              }
> >>      }
> >>      case IIO_EV_TYPE_THRESH_ADAPTIVE:
> >> -            if (state)
> >> -                    return regmap_field_write(rf->int_thresh_var_en, =
1);
> >> -            else
> >> -                    return regmap_field_write(rf->int_thresh_var_en, =
0);
> >> +            return regmap_field_write(rf->int_thresh_var_en, state);
> >>      default:
> >>              return -EINVAL;
> >>      }
> >>
> >
> Hi Julien,
> Sorry for the delay.
> "int_thresh_var_en" corresponds to APDS9306_INT_CFG_REG bit 3 (Datasheet:=
 INT_CFG, Address: 0x19) which
> is a single bit value only. If user does "echo 4 > /sys/bus/iio/devices/i=
io:device0/events/thresh_adaptive_either_en",
> which trickles down to the "state" variable, do we really want to write a=
ny other value except "0" or "1"?
> Correct me if I am wrong here.

Hi Subhajit,
In drivers/iio/industrialio-event.c, iio_ev_state_store is actually
using kstrtobool to check user input, then gives the converted boolean
value to write_event_config.
So state is a boolean. By the way the purpose of this series is to
clean up code and use a bool instead of int for the state parameter.

So new code is equivalent to what was there before.
Cheers
Julien


> Regards,
> Subhajit Ghosh

