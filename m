Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72728E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5i3XUVgXE5LBE/u88j/6g0pszm8yGFLlC7fyQ/F7wM=; b=fW/09VcxNfT35e
	9O3EWwMe3EOEv3N9yb74WUfNKjlR3oIkglrFu16Tu1QuKY+vQf72mWL+4o67b+Hpeg9cYpFULVEF5
	tXhNPgxA+yDb/jLjXyPBWRFYZBZGjz2N7DD4Psuaav30LR+laqC4kJmolH9JJA9dLQkWzFnVcev54
	lAJ0Mucb7mKcWu8k6j+cspP7hYuBtZEcO5N4LzKq958p3H3bZ8MLwgDfPmv72iysfY+d8RzESSywD
	bS7+8RV/GcIUF4eta9bpJSvzMzeUCo5q35KZUVsWF7c//HmfzsnpuArfAXz0SqIaLrKycf/yqg0IY
	LZz1laQwrNqMZ8pi/uMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWb7F-00000000oX9-1Jyn;
	Sat, 11 Jan 2025 13:01:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWb61-00000000oQL-427t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 13:00:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2612E5C5764;
	Sat, 11 Jan 2025 12:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A6AC4CED2;
	Sat, 11 Jan 2025 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736600406;
	bh=uhgW4pxNgqADt4AOUceOlVdwTIimyMAZeZHRtYxpCn0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iYg6hcIfg859hA4bX6k87XTbZGz6aE6v02J9QgJ9kmL3+VzEyw/SNqMjDAt1sy0mC
	 4H9OKuQ0bJAo0luuL1tYbqm3AFFZpXH6AMmjK+0iIUVlOn94kulTTv3wxvdlcS/HDT
	 GYQ+6hVx3nEYzdH/PgB7VyQBE7BTnQw0nuIORItNaVM3nWl2BUGTXE+3qM39qlCUDs
	 bG+jRr6y2EswYHy8omqLrNrQukRDYVsKLZ3mOHnoXnY+yCoBs2far2nYjKzxtvG7be
	 8sz0eWnsAk3lGvNvKdO0liAy7o/W+EDM/E0QIZgAiOZr1Nv11ah8VWMIrU74JyFV3l
	 sVMc32sPA0huA==
Date: Sat, 11 Jan 2025 12:59:58 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: <Nayabbasha.Sayed@microchip.com>
Subject: Re: [PATCH] iio: adc: at91-sama5d2_adc: fix sama7g5 realbits value
Message-ID: <20250111125958.34d2ebdf@jic23-huawei>
In-Reply-To: <fc0547bb-4563-4a76-90df-88ec57407360@microchip.com>
References: <20250103-fix-sama7g5-adc-realbits-v1-1-1732d265c36a@microchip.com>
	<20250104133804.2a3c2ba3@jic23-huawei>
	<2bc88c08-c594-4f76-9873-ca7ca488ea0c@microchip.com>
	<fc0547bb-4563-4a76-90df-88ec57407360@microchip.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_050010_100926_5BF63F49 
X-CRM114-Status: GOOD (  19.08  )
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
Cc: devnull+nayabbasha.sayed.microchip.com@kernel.org, lars@metafoo.de, alexandre.belloni@bootlin.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, eugen.hristev@linaro.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 7 Jan 2025 05:49:09 +0000
<Nayabbasha.Sayed@microchip.com> wrote:

> On 07/01/25 11:13, Nayabbasha.Sayed@microchip.com wrote:
> > On 04/01/25 19:08, Jonathan Cameron wrote:  
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>
> >> On Fri, 03 Jan 2025 16:50:40 +0530
> >> Nayab Sayed via B4 Relay <devnull+nayabbasha.sayed.microchip.com@kernel.org> wrote:
> >>  
> >>> From: Nayab Sayed <nayabbasha.sayed@microchip.com>
> >>>
> >>> The number of valid bits in SAMA7G5 ADC channel data register are 16.
> >>> Hence changing the realbits value to 16
> >>>
> >>> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>  
> >> Please send an appropriate fixes tag so we know how far to backport.
> >> In reply to this mail is fine (no need to send a v2 for that)  
> > Fixes: 840bf6cb983f: ("iio: adc: at91-sama5d2_adc: add support for
> > sama7g5 device")  
> 
> Small correction:
> 
> Fixes: 840bf6cb983f (iio: adc: at91-sama5d2_adc: add support for sama7g5 
> device)
> 
> Thanks,
> Nayab

Hi Nayab

check Documentation/process/submitting-patches.rst again.
Neither format is correct.

Given the multiple entrees sent mean I can't pick this up automatically with b4,
please send a v2 with the correctly formatted fixed tag.

Thanks,

Jonathan

> 
> >
> > Thanks,
> > Nayab
> >  
> >> Thanks,
> >>
> >> Jonathan
> >>  
> >>> ---
> >>>    drivers/iio/adc/at91-sama5d2_adc.c | 68 ++++++++++++++++++++++----------------
> >>>    1 file changed, 40 insertions(+), 28 deletions(-)
> >>>
> >>> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> >>> index 8e5aaf15a921..c3a1dea2aa82 100644
> >>> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> >>> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> >>> @@ -329,7 +329,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
> >>>    #define AT91_HWFIFO_MAX_SIZE_STR     "128"
> >>>    #define AT91_HWFIFO_MAX_SIZE         128
> >>>
> >>> -#define AT91_SAMA5D2_CHAN_SINGLE(index, num, addr)                   \
> >>> +#define AT91_SAMA_CHAN_SINGLE(index, num, addr, rbits)                       \
> >>>         {                                                               \
> >>>                 .type = IIO_VOLTAGE,                                    \
> >>>                 .channel = num,                                         \
> >>> @@ -337,7 +337,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
> >>>                 .scan_index = index,                                    \
> >>>                 .scan_type = {                                          \
> >>>                         .sign = 'u',                                    \
> >>> -                     .realbits = 14,                                 \
> >>> +                     .realbits = rbits,                              \
> >>>                         .storagebits = 16,                              \
> >>>                 },                                                      \
> >>>                 .info_mask_separate = BIT(IIO_CHAN_INFO_RAW),           \
> >>> @@ -350,7 +350,13 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
> >>>                 .indexed = 1,                                           \
> >>>         }
> >>>
> >>> -#define AT91_SAMA5D2_CHAN_DIFF(index, num, num2, addr)                       \
> >>> +#define AT91_SAMA5D2_CHAN_SINGLE(index, num, addr)                   \
> >>> +     AT91_SAMA_CHAN_SINGLE(index, num, addr, 14)
> >>> +
> >>> +#define AT91_SAMA7G5_CHAN_SINGLE(index, num, addr)                   \
> >>> +     AT91_SAMA_CHAN_SINGLE(index, num, addr, 16)
> >>> +
> >>> +#define AT91_SAMA_CHAN_DIFF(index, num, num2, addr, rbits)           \
> >>>         {                                                               \
> >>>                 .type = IIO_VOLTAGE,                                    \
> >>>                 .differential = 1,                                      \
> >>> @@ -360,7 +366,7 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
> >>>                 .scan_index = index,                                    \
> >>>                 .scan_type = {                                          \
> >>>                         .sign = 's',                                    \
> >>> -                     .realbits = 14,                                 \
> >>> +                     .realbits = rbits,                              \
> >>>                         .storagebits = 16,                              \
> >>>                 },                                                      \
> >>>                 .info_mask_separate = BIT(IIO_CHAN_INFO_RAW),           \
> >>> @@ -373,6 +379,12 @@ static const struct at91_adc_reg_layout sama7g5_layout = {
> >>>                 .indexed = 1,                                           \
> >>>         }
> >>>
> >>> +#define AT91_SAMA5D2_CHAN_DIFF(index, num, num2, addr)                       \
> >>> +     AT91_SAMA_CHAN_DIFF(index, num, num2, addr, 14)
> >>> +
> >>> +#define AT91_SAMA7G5_CHAN_DIFF(index, num, num2, addr)                       \
> >>> +     AT91_SAMA_CHAN_DIFF(index, num, num2, addr, 16)
> >>> +
> >>>    #define AT91_SAMA5D2_CHAN_TOUCH(num, name, mod)                              \
> >>>         {                                                               \
> >>>                 .type = IIO_POSITIONRELATIVE,                           \
> >>> @@ -666,30 +678,30 @@ static const struct iio_chan_spec at91_sama5d2_adc_channels[] = {
> >>>    };
> >>>
> >>>    static const struct iio_chan_spec at91_sama7g5_adc_channels[] = {
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(0, 0, 0x60),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(1, 1, 0x64),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(2, 2, 0x68),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(3, 3, 0x6c),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(4, 4, 0x70),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(5, 5, 0x74),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(6, 6, 0x78),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(7, 7, 0x7c),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(8, 8, 0x80),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(9, 9, 0x84),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(10, 10, 0x88),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(11, 11, 0x8c),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(12, 12, 0x90),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(13, 13, 0x94),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(14, 14, 0x98),
> >>> -     AT91_SAMA5D2_CHAN_SINGLE(15, 15, 0x9c),
> >>> -     AT91_SAMA5D2_CHAN_DIFF(16, 0, 1, 0x60),
> >>> -     AT91_SAMA5D2_CHAN_DIFF(17, 2, 3, 0x68),
> >>> -     AT91_SAMA5D2_CHAN_DIFF(18, 4, 5, 0x70),
> >>> -     AT91_SAMA5D2_CHAN_DIFF(19, 6, 7, 0x78),
> >>> -     AT91_SAMA5D2_CHAN_DIFF(20, 8, 9, 0x80),
> >>> -     AT91_SAMA5D2_CHAN_DIFF(21, 10, 11, 0x88),
> >>> -     AT91_SAMA5D2_CHAN_DIFF(22, 12, 13, 0x90),
> >>> -     AT91_SAMA5D2_CHAN_DIFF(23, 14, 15, 0x98),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(0, 0, 0x60),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(1, 1, 0x64),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(2, 2, 0x68),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(3, 3, 0x6c),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(4, 4, 0x70),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(5, 5, 0x74),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(6, 6, 0x78),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(7, 7, 0x7c),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(8, 8, 0x80),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(9, 9, 0x84),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(10, 10, 0x88),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(11, 11, 0x8c),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(12, 12, 0x90),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(13, 13, 0x94),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(14, 14, 0x98),
> >>> +     AT91_SAMA7G5_CHAN_SINGLE(15, 15, 0x9c),
> >>> +     AT91_SAMA7G5_CHAN_DIFF(16, 0, 1, 0x60),
> >>> +     AT91_SAMA7G5_CHAN_DIFF(17, 2, 3, 0x68),
> >>> +     AT91_SAMA7G5_CHAN_DIFF(18, 4, 5, 0x70),
> >>> +     AT91_SAMA7G5_CHAN_DIFF(19, 6, 7, 0x78),
> >>> +     AT91_SAMA7G5_CHAN_DIFF(20, 8, 9, 0x80),
> >>> +     AT91_SAMA7G5_CHAN_DIFF(21, 10, 11, 0x88),
> >>> +     AT91_SAMA7G5_CHAN_DIFF(22, 12, 13, 0x90),
> >>> +     AT91_SAMA7G5_CHAN_DIFF(23, 14, 15, 0x98),
> >>>         IIO_CHAN_SOFT_TIMESTAMP(24),
> >>>         AT91_SAMA5D2_CHAN_TEMP(AT91_SAMA7G5_ADC_TEMP_CHANNEL, "temp", 0xdc),
> >>>    };
> >>>
> >>> ---
> >>> base-commit: 0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
> >>> change-id: 20250103-fix-sama7g5-adc-realbits-37f62f8925d7
> >>>
> >>> Best regards,  
> >  
> 


