Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F2FC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=; b=ueLY64h5FzcOwvb1uNHmC7xAZJ
	jDXh+Tb2piR4ang61KUvWii3GBNdKMDyDaNNkUMpvQTwjaTu+5o9qG5lC7LWhMiElr6YfFj4ex02e
	S08gjvttqEdIVuzQo0lgUyQl7N1BJKk62U26Pnbp1XhsoTTjAjHAmgO2nATEqiMlyxcxEdMsXmMjt
	UbAURp1Zm1hRjdGJQbz91CYChvqyFiWY1o/kU5wULLUMe/r3w7JarFZptJP0nqkLKuIjw9w+DK5Kh
	0KOBRQILTSrxaBzKJp5T4uCCXUZ2oEs5aoaB+LTCzicR3CibvFFvNnLfAezPfnwivF8EWnVxsskDH
	rp5sfPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yPG-00000009bDP-3SQ2;
	Tue, 08 Sep 2026 16:10:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yPF-00000009bCU-1v2h
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 16:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=; b=OQJYkXg7t68fQzPjYokByGQCLV
	TTZuArOgvzKdcWwOKkzCp6zbeJDzTgi5jYcw/ZIxDYHYr5x9DtVvPBy3g5p/hh7ktI41B4HIcYLJy
	4g8yxWdx/4lDzbYFfCCbushPGsA5RnGqFUHsi0dthgU/NJWCTDIvM3ZRQdP0L/KwIjqVqXoU7xa+k
	67rs9kkKN4Cd0w+gO3SqLtwWKiW6AFW8q5f+z0ogUTMI5SY/ZSmsclWWW7K2MqO+GHb0PlM7zYOhY
	5hb14hVTDzSp8k+zUFL9JssWS0QA+E5uUuqpqAj9rSuWBzcK7mzeWch0HzCGHw4FvutvdJOJKqp5v
	w/LIBcCQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3yP8-000000004N5-3Hgz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:10:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdpBQ3965013
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 16:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=; b=aKZUnAuwuOC2Mm6N
	dnQmHwM/RpKfmdDSX2+/4jASJo3vSdpnXrxREnPkUcqp2Bai9fmtJ5QWJmxbpT/m
	wgrSAgHAITZ/JdZx8jGT2Mz4RRt0yMoyifzyoeAfz/BUNL6tgruWcrZnc2mg8HXV
	/U1RpNx+N4ys4fKzP1hSbIkJxFkWqPQsi5/YMFnaNE1oVQ40463t07K/NmnYgZOf
	iS7zUFB4d70yG5ixvflOqQSRpU4DcxKpcl0MDLIILYOJcSdLy3Aw4uxvFd6MhR9a
	QxfCdi3dzrNHLVzZUe31/YIOZqNCn+AUVV59ucc5nIVBUmf/7SZTvKhgMqj2AzbL
	xA7B6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp49qk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 16:10:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f73d0f89so62523005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 09:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883829; cv=none;
        d=google.com; s=arc-20260327;
        b=sw5DjNn+1MInnM7KEp2p098kbjE446aKVWwFOyLkadEhNhPdDATXFCGaEit5SLX8j8
         FGMlk+YuSyLfaG2ZTeQLysV9luZn6VpoTywISHk04xsZ2JBwb/xOA+8IsG4q6MuFaq4u
         oKbcdC2WQcw7UN/OVCk6ydWaZlDzw+PWi7fOZ8ox8mTAhyzbBa81+HfztUOOvI/F4Z09
         tUgLzWahAv32ly/k983626NDI2j4XSnZEYnUEOvIVlspmDTHgiVCgnOCypZZrTFQzuvM
         dY68uuH0T5m+OOnlSRHT21WwC1ZetCp1fB2jDWJBWelZKNcVmHh6wnZ1L4SU0rQ7SaOH
         uX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=;
        fh=TzV03Fd5fn0nO0FBv3EhLldUIesCpqMczQZlr3DsE6U=;
        b=HlaJ0cSDM5ihgWkGOBM7NEuUaqEJuSRHn1OvHSJ2Hfu6y97UdSY01gPGM8T2Ym2Xtz
         pmXXqltjmatAuUEEJdv+f8qOyhg2vcYHtLMgr+c2ZFsejaoJWhympjVM0xigqkcjiqGa
         UKLowTFSf170vMSfXQd9/ohZ1hHJhfQQevTlC4gFNCWzpLa6neVlKOk93aAUn2Dm8i3e
         LQtI3X2KI8j8YacBQoe+3XQ1GCJraBr5nTGlFg0g1tu1Pnn9cRLgrxYzGV9Wb27aZqy8
         o5x46N3r/8pC+1o2I5zDD7d7dYZFzIrp1gPl1cRXHuQk+8oED+KJJQszmOdmMMV7DzZh
         1dmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788883829; x=1789488629; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=;
        b=LbENuoQ2G2TI2YKzjsr71StXEDraiB61rABhbaTgU4htHWSfbossjITbCsqdBXWgpW
         6XQz7HHJXfE945c/qswKpD2l/P6xX/HAMCSz3RhG2S4D0BmKAdCxZEcICjHgWnZ6mqi6
         Aor5+22iM/8Y29GaOWxNdZmVwy9ZHyO5/d0Oetl4SQKcysYxPwwDU+N8C3IqF1OOHXT7
         qoUsEzWHVS4J4H5ECQBggqkskIwz+bzk+6IfdVQhmmVgRdYgBMkRRdq0cR76TuxD7t2L
         K52+pq1YqRkgz+r4zQtHwjrpeFvVyzDfMP4HDHbrwr7Qq9IrmTM9lo6kDwSzz09tkUw2
         Rvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883829; x=1789488629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=;
        b=BHbwc/98xq3uVqJ4D5cchi4S9XhuZAlPV4a8d3GjMK0iUAhh7dv003HRpgjRoJEcus
         aWtIIke1TmtobyKJnRKMRuUQrNx0JljD5smR7NOvsZYqQz2vltzIHObg/f+fXKA/470y
         GlfNJm0JafWcU1UlTKO8qjI8cxRHBEa94Az6bzmV9aVvHpsNv/psKIeEpNUWHlK45RiR
         15oOU4TGaH9dccUNUbfjpyh9LhXzUPwZ9zHj4TZjVjAkoZuT+7to+mdVcLjxgwv0aWDr
         wOzOKD4XmWq7cMIOCcEG6hvibA/AhnondPoqLRbvXh4qW+lSZEPiRtlyH6qtE4g1yxBg
         nmQg==
X-Forwarded-Encrypted: i=1; AKwUvBycIWHYE65Ra/ix/rC7/VnODSek3s1dMQU2dnlH/VGc266t0C3MIQtmnyrdJ5nQ0X2n/MPncg9zRp7NRk0yM415@lists.infradead.org
X-Gm-Message-State: AFuF++nBQEfEcshq7bY1lSF1bB+8X7wCbUFEJDor+mCF44+69djm8mkd
	P1E+HTX29cZTdxLHVwPcI0X8L4VdLIS4O5MqQ+tEgwohfBdKBtEWJW2uBwinmwXcAEEuEWdRWkB
	WoR5+bHTrqeakG2e2XqBPK7sghi60tTg/zkiEYYsSEtlgEEziptmZ5E66ZYc/5KDskePtR2ErBb
	E59Axzw5NQ2gcrKtp855Sja8Odo1sGsGSsASrERGHokvuNsfNAx1aw
X-Gm-Gg: AYBFou2G/cx5d+Ce1wObqPU8P009mIJliKhX2f6J3JT0G550L363A3iWjuSOv0l2zAm
	78oCK6YFf1WlVTp7qZg5/czz9j1LetwftF+kGISEGzjImGOkbeveRr2yqvjBAagx/WynCaKn4y8
	n/QmllXMkoOZ4EfuBVCV+RxmLojpgLO1jAxAlaAUbdaWyIa8GGOhtaHY9KAA==
X-Received: by 2002:a17:903:b48:b0:2da:effd:f904 with SMTP id d9443c01a7336-2db1258c686mr415607955ad.8.1788883829142;
        Tue, 08 Sep 2026 09:10:29 -0700 (PDT)
X-Received: by 2002:a17:903:b48:b0:2da:effd:f904 with SMTP id
 d9443c01a7336-2db1258c686mr415606815ad.8.1788883828558; Tue, 08 Sep 2026
 09:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787240090.git.geert+renesas@glider.be>
In-Reply-To: <cover.1787240090.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 18:10:17 +0200
X-Gm-Features: AcwNN1VTV0JnOl-p62U3bYhCoItyrrp3uBkyaa2BVtYCssF8EZkcLiIZNULpQBs
Message-ID: <CAPx+jO_Q2A1LAM-1MTFwGpULkiyHzWRUE_tpWYWfO6JzFAcdxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michal Simek <michal.simek@amd.com>,
        Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa0337a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=gdcvayKpbD3v4lRZIwgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: f4P83kNpcHtuRAuYVzsgjF5siZ7R7p9I
X-Proofpoint-GUID: f4P83kNpcHtuRAuYVzsgjF5siZ7R7p9I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfX5FgJbUmF6GHH
 hnIjxK0tC/ZhusPSWZQriBVca96nCpgGk2QJu9pkBRSSehbR9FnP1DgaLuoNhPpuOO1AwGrNWwM
 d+NrhizdfKfMv//1VJw5hnYd0Xaa8SmfQtEO7TVeYVsUySm3/PK42bOlDK+t4MMXTpvHKax48F5
 cXcBqSBNbNHTO+dLcE5KOuPnsR7MxTAHD+iUJigukrCfs4flDT7EYoYDbdSUh3i26gGGg59jcpD
 Z7d1H7TQ4b2aA2Ra0/VqJfawJUsPvBC8Qck9WFo1+KaZ8mimUP8ytNRlG23NuD27YiT3FmpsF8f
 jKfEtRLh9kg8MvELy/kXW4dv5/mjNH1SCUFKkqw6yj4gAzs33GnRF1z5mj8NVUEW5K3bqxW3WEV
 zqLW+kEgsqiVBuRO7oLcAACOo5AyXvq87YAJtLVb3v5IvE+jMqHQCpknHu2MoC/CL5aojKWPOei
 URSJ/faXk5upjLDSAxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfX/BpXDUjMa8Pm
 9g77kizxFEWeK7Pkeq6JgJbu4XuxUBF8hfJ3SiXzu0OKH5XSOBhH6KMTImmA0z6fGbLOfwdloqU
 iyJ+LUAryeqjQlOmczYwj5TKIZ4aiJE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_171039_146467_B4DF2C24 
X-CRM114-Status: GOOD (  23.14  )
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

On Fri, Aug 21, 2026 at 12:06=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
>
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
>
> This series is the MMC subpart of Part Two, which fixes remaining cases
> that are currently harmless.  These are still fragile, and may cause
> future breakage when converting drivers to a different method for
> specifying the parents.
>
> Thanks for your comments!
>
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be
>
> Geert Uytterhoeven (2):
>   mmc: meson-gx: FIXME: Make sure clk_init_data is fully initialized
>   mmc: sdhci-of-arasan: Make sure clk_init_data is fully initialized
>
>  drivers/mmc/host/meson-gx-mmc.c    | 2 +-
>  drivers/mmc/host/sdhci-of-arasan.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> --

The series applied for next, thanks!

Kind regards
Uffe

