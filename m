Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661FFC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 13:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BoBUQia1Gkv+KG0WwE4FRo6t6eBEUNEzp5JdU1kJc0=; b=Sk0zdzWtHzE19LdZg8U+HiR9Fm
	lkJq//TV63GkNC9ZNJ00QW9VXsm2zqwgjO0CHe7DrcYK8g2KeJEhpaf9xFIIVTpqgg9Xo/h5ZSSgs
	jr02D35Se+a27Tjll4DMHsD0vFPpaDvhFIuboqmC0Y7OWOy1pwi3BlL0HDTtlQfaSoGHIN8uE8MEO
	DA813rBo4OQcd4MbKvP1aloJC8DdzI/YbsZC1ZfL1JynNDP1nLljF6scnjvjBpZ+EsKAvF8z7lX/j
	DoBNuS760S3mNfC1DkzE39V7PGpjNakrsaw6CeouPjM8NzbCtalkYH9Z3u3y/AQPZqZbH0TtvF1TQ
	3g6lhZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHN2Z-0000000D10W-1gmb;
	Tue, 20 May 2025 13:29:55 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMzk-0000000D0XQ-2lyD;
	Tue, 20 May 2025 13:27:01 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id B0B1EC405A46;
	Tue, 20 May 2025 15:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl B0B1EC405A46
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner <heiko@sntech.de>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  Jacopo Mondi <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman
 <megi@xff.cz>,  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
  stefan.klug@ideasonboard.com
Subject: Re: [PATCH] RKISP1: correct histogram window size
In-Reply-To: <aB31Eg6oRpcHHEsb@pyrite.rasen.tech> (Paul Elder's message of
	"Fri, 9 May 2025 14:29:06 +0200")
References: <m3tt5u9q7h.fsf@t19.piap.pl> <aB31Eg6oRpcHHEsb@pyrite.rasen.tech>
Date: Tue, 20 May 2025 15:26:58 +0200
Message-ID: <m3jz6b8lb1.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_062700_862235_E19610CB 
X-CRM114-Status: GOOD (  16.48  )
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

Hi Paul,

I'm sorry it took that long.

Paul Elder <paul.elder@ideasonboard.com> writes:

>> Without the patch (i.MX8MP, all-white RGGB-12 full HD input from
>> the sensor, YUV NV12 output from ISP, full range, histogram Y mode).
>> HIST_STEPSIZE =3D 3 (lowest permitted):
>
> According to the datasheet, the histogram bins are 16-bit integer with a
> 4-bit fractional part. To prevent overflowing the 16-bit integer
> counter, the step size should be 10.
>
> Do you have any other information on this? Is it known that it's stable
> and consistent to use all 20 bits anyway?

Interesting. I only have those mrv_*.h files which come with
isp-imx-4.2.2.* package(s). Here we have (among others):

/*! Register: isp_hist_prop: Histogram properties (0x00000000)*/
/*! Slice: stepsize:*/
/*! histogram predivider, process every (stepsize)th pixel, all other pixel=
s are skipped */
/* 0,1,2: not allowed */
/* 3: process every third input pixel */
/* 4: process every fourth input pixel */
/* ...*/
/* 7FH: process every 127th pixel */
#define MRV_HIST_STEPSIZE_MASK 0x000003F8
#define MRV_HIST_STEPSIZE_SHIFT 3

In case of my IMX290 1920x1080 sensor, 1 doesn't work well (it stops
counting before reaching $((1920x1080)) in each bin, and even if no bin
reaches this magic value, the total count may be invalid (not equal to
the number of pixels). IIRC, 2 worked well. Maybe with higher
resolutions, I don't know.

I'm currently using "3" per the .h file:
isp_hist_prop:
32E12400: 1Dh
histogram_measurement_result:
32E12414: 0 0 1 1004 569 476 633 1197 2373 2212 1923 2945 3632 3025 5821 20=
4589
which sums to 518400 =3D 1920*1080/9.

Setting "2", the same input scene:
32E12400: 15h
32E12414: 0 0 0 2194 1263 1096 1406 2528 5228 5052 4291 6354 8322 6943 1320=
1 460522
which sums to 518400 =3D 1920*1080/4.

Setting "1", the same input scene:
32E12400: Dh
32E12414: 0 0 25 9046 4924 4317 5435 10655 20781 18965 16051 24716 32681 28=
368 54301 1048559
which sums to 1278824 which is rather less than 2073600.
The last number (1048559) is the magic one, no bin can go higher. Less ligh=
ts and:
32E12400: Dh
32E12414: 0 0 0 0 0 0 184 3059 11970 75298 114898 211444 429772 439922 4003=
58 386695
total =3D 2073600. But don't rely on it too much, the "1" has problems.

In short, those are integer values. One may use them as fractionals with
some clever step size, I guess.

>> isp_hist_h_size: 383 (=3D 1920 / 5 - 1)
>> isp_hist_v_size: 215 (=3D 1080 / 5 - 1)
>> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 229401
>>
>> Apparently the histogram is missing the last column (3-pixel wide,
>> though only single pixels count) and the last (same idea) row
>> of the input image: 1917 * 1077 / 3 / 3 =3D 229401
>
> I don't quite understand this. With a sub-window width of
> 1920 / 5 - 1 =3D 383, shouldn't the resulting total window width be
> 383 * 5 =3D 1915? Same idea for the height.

It would, but the stepsize =3D 3 makes it ignore only the last one
- i.e., normally the counted ones are 0, 3, ... 1914, 1917 (which makes
1920/3) and with 383, it ends at 1914, thus only 3 pixels (1 really,
instead of 2) are missing from calculations (not 5). I guess the same
vertically, 1080 divides / 3 and 1075 doesn't.

> The fix looks fine though. Although, I'm wondering if there's a reason
> why there was a -1 in the first place. Does anybody know?

There is slight chance it's different on some other SoC, but I would be
surprised.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

