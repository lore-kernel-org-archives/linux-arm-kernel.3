Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBE1C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=; b=XnAkvY27IsYEOj3RC4O3zKo4io
	GClk8zMMqE6RyuGe8XKSoClBZBWFO2mgpI+kwDQQ+r8LKjBTQE9PGXbp7yTAHbdiYwHFwpzbUfRUr
	OPCSufLBd06jZLKShYMAKnwNiNhUqJOixR7dt0tVushy/uSbM/sEn5EhKfLjRT8HBQp1mF6RIZPTZ
	TLj/9jmkVGdSAU29j5Cvz5sBOi+Br4TWLZj3x0hnp4o/RcRFIyV+ei95AZsf1ABuQ2d5XBBIl//29
	ZyjUPxs5l3iuwAL1ikNp7W022SjIXLpfyK1hC23Uf0sQq9sjtrTPJuwAjYQL3Q4M2tivXdpHwl+yP
	Dz24LMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63dM-000000033rX-1ZlR;
	Mon, 14 Sep 2026 10:09:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63dJ-000000033qO-1YAw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:09:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9ndoc184559
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 10:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=; b=cd1MyXOoNTeupvMQ
	1vlzwu5O9fxeTHN1l64x7hYxAujJXzKCr2fbv9EZX3jztY8QgA3bEZef7KsAMG0Y
	TpweHent0/06oxXjwNiUy69cLhEs3kQa+1FH0mH6pmWttYiTZirymHZCQliftGJK
	xD/mTq439qWXuH534GY9JYVWAu9ZMnjUpgL9Mfhbyful2WZqAvrC8uES+ZxUGAGE
	Ns9w53JtZXdxDqMJwCIuhBgM/xW8vEWWGbQaDEjzKqx7a8UwaGrBeh0bD59fG0Wc
	qmpoz10K8tCCzLSstgxH7TdoWJ4m2zAJerQpmC4T7IM94HQn3vHbZG9Hvrs6Dse9
	3CyQTw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c6356-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 10:09:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2467446a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 03:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789380591; cv=none;
        d=google.com; s=arc-20260327;
        b=Q1yyQWlLNtG4gA/bnjfDqPcFD66O0e12zkMZRCkhJ8NfpjrfdsARwC1hqiGeHi+YEi
         +27BeVpKl1EkD9IXvLGPRvFRA6heSX0FTvJuEnRs7/GljEVe6DuhlsN4Dvsm3OIjM4gF
         bu2qWWufWL0pqRL/zVwypKOo3KWquTT7NT7vZduhcrgyEiBz14fhB7WZjb+sO6rA89Dl
         0h2ABU/o1q76rz97LfRQ21gSCzNkQZ5hkeXOZf3VBtBWlLTD59N0cUgDB2lumj8eD5Ma
         zNdThDwI0n0dTlfljF5ZedN+3NgVOpYftAOab9NDlOSEdlRIbJmxmyIb+H2wrX2Sc5Ke
         1ixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=;
        fh=isizvgpBqyo6k4yKDRjhzQ2TizBSTYPGKFX0tuyIz+s=;
        b=SiDgHrI+FDQH1cZw7H5mZ/Xbd55Xs4jpdrXGHYiGFamOQl1OgYBzGZqRHp1oIk9tIt
         BjaTmU3tBKUhawxSDdjEy77TYvDV0farTTCXGF0buWOHGd50tm+P/ggKmFr9VmqkRY9C
         TDkhT9RRn3EElBzirnyXlX1QEpJqS3LoqIQI9DJyh7s6ivJTgWnf7JcHma4TRXGd1ePA
         v3q55e4BlYEGXQNlYRATmRAgk6KA9X3FEK4OhjVPBYVm2YsQejsz4BOqbcfTKhuVH43g
         uPQFFAoR0uvhIsmvDuTUY7YAnt/Aqvcb+Rbo4dPaFhdNO9gtYRbV47pWW5655yPxtNeA
         kI/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380591; x=1789985391; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=;
        b=DUuoBYtCexjZAcNWzkVsriPGmiePStCWJvJuFc+9IQtMcpb8ry6str2jADg+ikkrwZ
         gQeGU4w/AMXDOEECvWWp2UpnCfR5P2es2Gw+xA6lcUItyiSt/LtZYO7zRoqxibimaXpU
         8YIXNc3Bj2+fA1OSXrarOTieJnG43jcA359ZKbwq1hSa2zSLYt20muJRakUZlSkCvle+
         gOaBL5Huw15JEtYABILj3Je/Rr3MdgD3addjijWgNrvxnnn9s9/AoVg85lvfj6xpoLJH
         lZGykKRE97l5qAe0UgWKiA7wMKZGSRuKx2zirjcSyg/XHpgCBUo6k/Xh8TT5zc6Zw0Gv
         l1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380591; x=1789985391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=;
        b=PSDEMezPMNqWIuyBFb8iAdJK7ok0mCVCvA2qheKKhHL3GxqvawvmqBjQtB0h3mLbMh
         FmDVx0f4HMQE50JuzcS/7ILmB04ZBb30cxGCvCC866MNg2rpuE5Xf7XsI7HOobmLzevl
         TGOrNHgAjoMAP0jiPAgV+Ha7M5NXaSrbyYwoCFof3ecPZpJHF4j10OC+26EjU9MqTS2e
         wIjQT1bvy5RksbryVayGv7rECojxNtcDHtN+/kzw7wT3lbOGB46zCiuwTQgwKBkOmOhA
         8znwXMevZD+vIBnIpgb+vr74WJwO2bnbW6ZlALiTm582QzNAm4soMwKI4UrXz1zfB8zT
         Nmaw==
X-Forwarded-Encrypted: i=1; AKwUvBz68g0c6+7FDGmNI9g01yGkCTXolh+o21ZkH2LY+McVKkJ4rXFk7JUa2o9kPSRYvIZp7+oNcQIDcP9Bd317V7+n@lists.infradead.org
X-Gm-Message-State: AFuF++lPiHa5V1PQLYcNhast+xk/GLgfLnAp9V5xqK3b+2kiiCBsx9mn
	gi9pA9sHI1g2KiF+AmbQqaK+aiBJ4aKi31qjAY3T1RHEfhHeEXvmdV7VnjsP/2e0gAOy6qqGfZK
	P845TgU41hbODpFnFQKRuAw1hop8yN1FO5p4X6ckpZgM22AAd3kZ8I/RBI4S58fwg+jpLYczflH
	P3R41kmeV20DY0lSRi5GzPLYDKeV+DvQCc5YRcPku/GnyVYAdjRB4f
X-Gm-Gg: AYBFou2EUheQloFhQ9D8oUpF0Sie9krn/pyd8k0KxYJtJvvcPE4j6rpL03QeC0H4y2/
	awKkuCqSgYjqUE5h7xqcflL2jAZKJha7SF1mr2Zt72HvuyUtTYgaAn8Cy1yh2jq0heT2gOhD3PB
	ZnOcwhWbIYQY55zkFZu6FXffXg9QpwqVI+iUDgJAQoxZoO0e5slnW/nUJ+Ww==
X-Received: by 2002:a17:903:b8e:b0:2d8:d4d3:3fbb with SMTP id d9443c01a7336-2dd6c73445amr40754475ad.15.1789380591328;
        Mon, 14 Sep 2026 03:09:51 -0700 (PDT)
X-Received: by 2002:a17:903:b8e:b0:2d8:d4d3:3fbb with SMTP id
 d9443c01a7336-2dd6c73445amr40754055ad.15.1789380590927; Mon, 14 Sep 2026
 03:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260913223538.91579-1-mhun512@gmail.com>
In-Reply-To: <20260913223538.91579-1-mhun512@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:09:39 +0200
X-Gm-Features: AcwNN1UKvtuQqttQbqd993vkvprGXBb1M6WJsKdk_G31r2WFSme_tK7rANZaz_8
Message-ID: <CAPx+jO-Vck8PzQjg4yn6ft4Rms2_9eSOLpbAQryMLChY87BPMA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-aspeed: Remove children before releasing
 SDC resources
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: u-oBEKcza101WK8PkJZuRHxs_GAjlAab
X-Proofpoint-GUID: u-oBEKcza101WK8PkJZuRHxs_GAjlAab
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7c7f0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=_cOgsa2NosUwn6K3uuEA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX01262LTayPh/
 eCqU5GvL5j1i7LgpYZ5jwPLnH3GU8EwDd5popoeIDYUX105nFMoTd/w5pp/zZucAhIsHWvTm2GV
 /oQyz1FHh/AYaw/yUg9vJB2LU5aOjEm3pcwv4rcSNHGdDbQ6cKLYjOEvqAsP2VboeGW0H3HJjBp
 kKBVQgWSlQGUycu1Rede+TGJF21OZOl7XuvKyfvIkS5WVnozN2dgzbxCrkQ/+IksT218YbhkAKV
 CFbQYILIoRnoucCMtyqtCWP9lBO257HfUiuXV3lKLZFf7MutnxIfDzjrDzvw6Ep0hq3MgCzqC08
 yrYHyB1jZ9TUi+sTKIEdM1xkQizpi0KW9JcQTPN6wKNFVhmgVCrHcpK1oIDaFm7Lb/sVZxvg/HL
 cU8Hu1PuVNcbeiJqFNJVeH8lc8VciPbvE68LjjFJMa7GHtPPA52L5Pm/fzWrsOyLt4KAMu5fhdE
 Lwl+bcAt71WlSAuOzFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX/yFYcUVZi3y1
 4mptzZKZQ5YFq82LyHDkhk2M79KhPsfHq3zT8+FoBdGM0MiuB7uyNLZsB+D3TPPVsqzaSI67y7F
 F1omEZvvFQu14Zo1YL/IvBjApOLDh3s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_030953_527054_09DDB0E4 
X-CRM114-Status: GOOD (  24.78  )
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

On Mon, Sep 14, 2026 at 12:35=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com> =
wrote:
>
> Probe failure and removal leave SDHCI child devices registered after the
> parent clock and managed resources are released.
>
> Unregister the OF children in reverse order before disabling the parent
> clock on both paths. Use of_platform_device_destroy() because manual
> child creation does not set the flag required by of_platform_depopulate()=
.
>
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
>
> Fixes: bb7b8ec62dfb ("mmc: sdhci-of-aspeed: Add support for the ASPEED SD=
 controller")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> Assisted-by: OpenAI:GPT-5.6

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Validated with an ARM64 W=3D1 object build and strict checkpatch.
> No hardware runtime, probe-failure injection or unbind testing was done.
>
>  drivers/mmc/host/sdhci-of-aspeed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-=
of-aspeed.c
> index f5d973783c..d317626feb 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -560,12 +560,14 @@ static int aspeed_sdc_probe(struct platform_device =
*pdev)
>                 cpdev =3D of_platform_device_create(child, NULL, &pdev->d=
ev);
>                 if (!cpdev) {
>                         ret =3D -ENODEV;
> -                       goto err_clk;
> +                       goto err_children;
>                 }
>         }
>
>         return 0;
>
> +err_children:
> +       device_for_each_child_reverse(&pdev->dev, NULL, of_platform_devic=
e_destroy);
>  err_clk:
>         clk_disable_unprepare(sdc->clk);
>         return ret;
> @@ -575,6 +577,7 @@ static void aspeed_sdc_remove(struct platform_device =
*pdev)
>  {
>         struct aspeed_sdc *sdc =3D dev_get_drvdata(&pdev->dev);
>
> +       device_for_each_child_reverse(&pdev->dev, NULL, of_platform_devic=
e_destroy);
>         clk_disable_unprepare(sdc->clk);
>  }
>
> --
> 2.50.1

