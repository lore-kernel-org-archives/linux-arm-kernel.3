Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177A1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UK8PbiajcOpYvYW0ar2JlHmkS0MuupsIJbGCtAbGkUM=; b=oee1SjkcTMJZlI
	lLTXW/59pJjokaG8aRHZJVlsCfd0uBZgHo3taoOZMDAoUmcbWOGbaLfCG6VmNtHPviAZqk9B3KVVn
	vRYyiLZ/htrg1e65xb7Z9hs63UOWn7sAbTk01E1hsJlPvFU08Gu45ol8J5wkQmB6o87viVjEmim22
	1r5LvJrDEEgAX8Gz5NHmDUtI03EEZVvKZQKfu99VfOy1m5YGEFhtdBylKoHeogykoedBST+TjNRl0
	j7n0ejWFGWTqWCJ0cMsNg4iXt3cxdlzGCW5c2ADyaocqGuXYXz/qZ7yoiQU+JzmlbaX3AHDQ/WDut
	JZdObs/M3L9UdhrLScUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LtK-00000008gnm-3Get;
	Tue, 22 Apr 2025 22:14:58 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LnI-00000008fnZ-25p7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:08:46 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-72c14235af3so3759925a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745359723; x=1745964523; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UK8PbiajcOpYvYW0ar2JlHmkS0MuupsIJbGCtAbGkUM=;
        b=s4yMt01izolWK5DYdPHftOTmOllhazPk31FNUxTXzfk74QYe22TMTNIKT8UI5S9g/O
         +WM5Fdk/2fSy623vtnVGZvrJVZZey0iaBOwwqU8vFYEtwBp+ceFFYlyMtja4tOnuWHBb
         O0TuJP/e4MlXBxoyrVe0VTbYWGe5/yeXBw5gUep/6wM244ILcKyhyY0GXUh3/5VtuNr/
         yRCfsCRSrd/nKDO3DMnXqzyVbBxr5gq1Ip41FVS95mKKdqHrQhiCdk7wE5Xcts/a2Y78
         reqarOaPbuem6OlvTXXqMhEF/C5at4rM93ibx4+LlktrHObKgHcW6cGXG8HkLR2XhTp8
         aG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359723; x=1745964523;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UK8PbiajcOpYvYW0ar2JlHmkS0MuupsIJbGCtAbGkUM=;
        b=C9oOy4hFlTEpcHnKXoCUX0ylrIiv6zWbT07OK4iew1yuRFzTlKpiXRwBX+gfJSyQPO
         tbJTb05Yt+DdWMX05l0A+Hj7vfBbTafmNvnYbLnuFvNKM05oEpvuxzQDL035yrhsqEIc
         icVWKblCSak4L9uO2fefiMpI95sGT+ZBHUKxhYywdN5CxKkXDPp2ulWgTZu23fmJmiDF
         GimKbyiq5+xsAABFAOssML01j7A571n3iz2DQ9aDE8HOylIzX3j5EAKQBEdziFUNWXRS
         feaQwEm0ky4ZK2ZdD/pVlM5YUE7iSK6UzoaK5aVHVvlvzND+lgg8HB6vS7ZHydyZFPa5
         YqFw==
X-Forwarded-Encrypted: i=1; AJvYcCU3muxTm2fr866RK0DLyZu0rnUZQxEpaNYHNCOsfav6aYA8FWeQxA9xT1068P/YZ0NZBiIkt9jBKH8si0N2OPbx@lists.infradead.org
X-Gm-Message-State: AOJu0YwgIz4m/coOhxBpqAfSqviQ6xcaUzNWLfUGor+Ybd9W3mSYgwDg
	JpZ7YpHueU2zL8leEDah9/rfFPI7sYvoRIQXVUbjEt0vyp3GR2XwlwdGNf39J7c=
X-Gm-Gg: ASbGncu369UBtTPLTqF6BbxUrV+98OC9pAprRpH7hoqRLUzMLHnJw7Q0+CLrtoOLmMx
	JcmyXB9PrxXlVTUiUQ1tqgvN9PWLswVi7iCu9aWb7WoCBNqn8byU4/oJcGp2JI3HvL3j56rI5Dh
	yUEJFnlNXoTSOS/FKJe6urrSToPHSxsLClsUJjDf7dtrIgqPoE7i39X+hHSEtBdPs0yDNyx52we
	pz3WkH9f5o56RkU4eBusdznCgHMnA1GMr3/Jz0g29/hk0HDIXQgdgbRrPpwYFblJSDYMlPCjdcP
	daShFHetICW2koaFthgwI8rfmFZNNF/FmpGCAx6PXJ2V5Gs=
X-Google-Smtp-Source: AGHT+IF49b6dl42zzEhPE+viwqBoREWaATjZV9raTcKU0/tbe0AdVa7W21BaShLy+/F/vIG+5DzRQw==
X-Received: by 2002:a05:6830:6992:b0:727:3664:ca30 with SMTP id 46e09a7af769-7300622d4e5mr10916324a34.16.1745359723490;
        Tue, 22 Apr 2025 15:08:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730048848dfsm2265938a34.52.2025.04.22.15.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:08:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v2 0/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
Date: Tue, 22 Apr 2025 17:07:45 -0500
Message-Id: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADETCGgC/53NQQ6CMBCF4auQrq0pRYG48h6GNKWdyiRIzbRUC
 eHuFo7g8nuL968sACEEditWRpAwoJ8y5KlgZtDTEzjabCaFvIpL2XJEz3GK5O1sYJeyYEZNoPr
 ZOSD1wTioGLh0bdNUrrHa1izfvQkcfo/Uo8seMERPy1FO5b7+EUklFxxAmFrqqtLC3Xu9jNgTn
 I1/sW7bth/SVdcs4wAAAA==
X-Change-ID: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2594; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=rhogGrbvpIiVq0G4TvM3WJ17ekGEtgtcDKvgCl8/7Do=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoCBM2U32J0Jom2quf2SqcjIS6bRq0JB/NvJ21a
 sjueXDvijeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAgTNgAKCRDCzCAB/wGP
 wGnrB/wNsBqRI2GZ9sOzr0F4p8FofM7AG5l+PtGc3eJ1OqI670Ap3vo+QuNdo5NP1N4cp2XTEnf
 vrSMI+T5OOcpEDI5EvUIIJeqzkDURnbIaYATNqIua5DDdR7RPCVxScPimhS0oHfl7XgXjYgIS3B
 YOiz9DEJvfXOaZd8msPCY+850eajcBbewH9veDYi5F8r26N15b7jWQuNkOpwC1okEKfcUbuzwSi
 VcL9rHzUWeDvJIG/OsRF1zZmcImQ3jz6G9DvUTQvFRlGRHlcCvz7jrK8405szLLrqE6q4QF1Oct
 x0SyyvAisTtFTbZrbQdMfOpf0cKscRMTzyziDyFzR4kVIsC+
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_150844_816034_887DBB0C 
X-CRM114-Status: GOOD (  18.66  )
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

Creating a buffer of the proper size and correct alignment for use with
iio_push_to_buffers_with_ts() is commonly used and not easy to get
right (as seen by a number of recent fixes on the mailing list).

In general, we prefer to use this pattern for creating such buffers:

struct {
    u16 data[2];
    aligned_s64 timestamp;
} buffer;

However, there are many cases where a driver may have a large number of
channels that can be optionally enabled or disabled in a scan or the
driver might support a range of chips that have different numbers of
channels or different storage sizes for the data. In these cases, the
timestamp may not always be at the same place relative to the data. To
handle these, we allocate a buffer large enough for the largest possible
case and don't care exactly where the timestamp ends up in the buffer.

For these cases, we propose to introduce new macros to make it easier
it easier for both the authors to get it right and for readers of the
code to not have to do all of the math to verify that it is correct.

I have just included a few examples of drivers that can make use of this
new macro, but there are dozens more.

---
Changes in v2:
- Add 2nd macro for case where we need DMA alignment.
- Add new patch for ad4695 to convert buffer from u8 to u16 before
  making use of the new macro.
- Drop the bmp280 patch since it was determined to have a better
  alternative not using these macros.
- Add a few more examples to show the non-DMA case, both in a struct and
  stack allocated.
- Link to v1: https://lore.kernel.org/r/20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com

---
David Lechner (6):
      iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
      iio: adc: ad4695: use u16 for buffer elements
      iio: adc: ad4695: use IIO_DECLARE_BUFFER_WITH_TS
      iio: adc: ad7380: use IIO_DECLARE_BUFFER_WITH_TS
      iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
      iio: adc: at91-sama5d2: use IIO_DECLARE_BUFFER_WITH_TS

 drivers/iio/accel/sca3300.c        | 18 ++----------------
 drivers/iio/adc/ad4695.c           |  8 ++------
 drivers/iio/adc/ad7380.c           |  4 ++--
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++-----------
 include/linux/iio/iio.h            | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 44 insertions(+), 35 deletions(-)
---
base-commit: aff301f37e220970c2f301b5c65a8bfedf52058e
change-id: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


