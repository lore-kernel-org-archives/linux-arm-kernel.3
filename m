Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82904CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cyq/qi3S500SGfwY/Y16YA84HAzf4qjNnDv4FUrmnpc=; b=o+QZtSiMv9Qy5rMlW6KtGQ9HqG
	eKRbeSF/HGXs57p2RptnLzJWeSygCiQDQBgUpUHHdwHDmxbjOaru1Ex0p2Mof9GIv0GtF7tKrFjx8
	sxg0CWkR9DroxY0kWXzIeDLUaQPW1IoT/Q3yLEQ6TD7BIC6CqL1FiPr/AQQbFjXWYbV/XA+cDftQ6
	Z4BSplgzcZbKY/JJsZLSb6qVAuzuZcQVTyLP3tg/FOtW3Vs7L59uIAN5LGZGWYCBDBBqK9wRfxNu/
	r927yM7uzLll1rRyBLGlILFzf3Iuf+awHWihpkPAq9BDhD2cIyiQynhOzdEWcFckk9Cmyuna5A9NF
	bcnwluxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXya-00000003gJ3-3AvK;
	Tue, 29 Sep 2026 13:34:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXyZ-00000003gIv-3q6V
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 13:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Cyq/qi3S500SGfwY/Y16YA84HAzf4qjNnDv4FUrmnpc=; b=LzcmiqiW/eHnoAHwhFzyCL0kWD
	zL3DAo5etkAbbjFyA5WRjiMrofTOCRxVVwbnQTmB0afKRovh8HBwHCqC8YSI3pqZoA+yUcpw1phwb
	Jyl1jTm4FpMRuzkJI0m35+ZLP6WhjiVleZZAttlBT0hIuXs/aPju83tpdIXmkcMQUzHWDgMa0S4qf
	FijrljTD5qB4o75c6ACKaU/axZ8qS12iziRkDvfHI/lO22T99B8wpZHqYKZteojwMmYbet/eKs26y
	BW6MJT0Nwsmo3xYtQSBt4vAjM3HoSikWcXuQFz5lagc1BLRawJveMsnVgifH+KzLdkS55lRp+e3ww
	n7X8PIRg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBXyW-00000002gUE-2Ugx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:34:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqcc41576980
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 13:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cyq/qi3S500SGfwY/Y16YA84HAzf4qjNnDv4FUrmnpc=; b=L6B7PzQ95luu6NSG
	tsplhetaATkbBDwcRKq8CZ5b99fh0r7298NXSO8pG1pbyZRNpOtnYDPyY2SUlmIA
	DXpQFOPFgcEosHgzA1mWB8f5WcaOCvzpSOn6IDRGGxMiV/7B8zL1AlNys3JmH2Nv
	uegLL5iUVnQHi3cQ3QhYyLzPRbBILozBJ2IeXFv9P371N4f2sewC3FFbR08SkC3r
	vYyA+4ej2h0ZqsQ5lwgUChjLaaAoGy8mu+1i6WJ+AEBq81Sa3ekEgGOxZvEqke/n
	Rub++tHob4UusV6U6x8zH99gxPR3/Se0HtilbUTL5Mm+WzSssewmOqO9tJimULTn
	X3u6cw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4s891-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 13:34:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so3026307a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688862; cv=none;
        d=google.com; s=arc-20260327;
        b=XfIab6BSFZfsLl1qj9bs933G8aNL5KF2OqjdhMAQjt1avJ6IwQWrAbviGixrfKXi42
         4k2UsBOWvtqgT3IrziGY0Pibs6+p187C7sRB+zkQh8Sy5Dwi56h57bqkTLN6tRSkyuW1
         hE3fbpkO+peeiPrfCS8sN5paN7q/z2xTmTQv0I711PLFi7VpyzQgs0j7XqS62/qZ6Ga8
         HFNUpVgp4o1xEa9LFVEU/e3wrchduQRFNIcQ4ddMm1ffSsxcoXL5Pg7OHrh/xkRe4gDV
         xFFB0OsYBOfsFUJ2ChCfC1Qvxkqo/g+AHtNekGJtUHql5JNjQ3dzuO3hu0cTkeuASUfW
         O3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cyq/qi3S500SGfwY/Y16YA84HAzf4qjNnDv4FUrmnpc=;
        fh=hdMgNgQPtGGSmFhgXe1kE2IvotPsiOxQPaYXHXzm9lk=;
        b=ZCmcqYXXydPqbMuAWhsSLsSPfWLlriHRaQRCOzo+MeEkzU/luJMKeGUmYnpIc/FrFF
         sfFEXAiomOxt+GWF0e2aCCvEPa+PvEQcc822H2dGA5DBcZ/9kdr38ASDSxIWzU3/d13Y
         FU9NrcbL9/VR1VC42122wEyrhIYFOlolHgLFvjAHauHW+UtjyODlmtpv18Hllkw3I77I
         7sbijdw6lFbMAgHWOGS/RIEJC6Su5/CX1UF9YUn5NLMd9rL6I2ZL29/N+FWaET4p5XZX
         UQ3cKxM9hCgSOo1wZVAO3eiatfZnZd3GeeZfGBwRwfnae25A7+0wT6QgibqVAgKXbKte
         c+aQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688862; x=1791293662; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cyq/qi3S500SGfwY/Y16YA84HAzf4qjNnDv4FUrmnpc=;
        b=Zk2zRxsb5q5iKiFoKKt0jnmEiUPocj2gFJ5v3OlKgJnQtPOV3WgKu8lHHZUpCMZ2in
         xqaEC2fpboPZ8B7qIZsY6La5njq0KzCUcJGEu4JRRYM7UKUgZFW1i6Rzs37/g254IwWo
         tDfUb5kGqly+mgcjt+t1fmO3tUxvRPnVxxjWuXivli5oBATzXGiuIa9LqIOkbP0anI+Z
         ueepaSlwQLISMKoFsS5+65vnwUWth6iGHqvzc+QpA3U2Iap51l4Q0q7s4SJ6KGVrf4Ol
         jOu8e7R7m+Fpwnq1ySPdAiTvVdMt3USS/yuXlTg9yyMP5l51Y4HUYodYEi1frugUncxO
         N3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688862; x=1791293662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cyq/qi3S500SGfwY/Y16YA84HAzf4qjNnDv4FUrmnpc=;
        b=iN/2Afo2y413ptiFVeiztxdz1+ah2XX+kBwSVq6/GH9l9v5mgw+uQL8fjf+9tjBoeY
         nekUu0aHJPqNAYM6SF3ZvMWXh7/a0azKo8YBfYW3pmwQXL4fXieUSCEuDqjlpAzKTHNI
         IRnAtpMYS9rq7E5+/1B2Yk6uVDxyQXFKsDl7L9CNw4GgpAZHA+NmbtFQCOG/JseBmqoL
         G8j//YnoAqqOvJFmUZ7fOGlxAka5v8XPW8XQA46j3BEL+i1qFe+COD4isSi+kox/VkRr
         jSUBZOSGOJHqEAuIneR3U/NFNfKDqOUjRivazx1HZiuTFQawW0Y4Tua43qZ+atx3aM15
         03dg==
X-Forwarded-Encrypted: i=1; AKwUvByfZMeUTloKRJ6nVyV6qVPvO9jKCIYkTB6M/eZTzb9AiJo04hUSNZCnxOksvlA/9gtqQE8RYUWem/TNf5XYWoP6@lists.infradead.org
X-Gm-Message-State: AFuF++nCZmmVJQem8Tkn5BsM3/pcR892geC/LeZckdsUzYK4Bm0LqR19
	t3gqaX+q6i38OHoqUfM64ZluzpXA5/AK3Y3+pcNfNjx9dIB5yU3g/u4I8RsNKecHloBKCHRQ689
	/ozPlcdBcA9LvB/8QIws3iIZhacdd8gzBToBAEGuxNysbCCv8sNcWUEOPExt0tNcxIDUSnFSXHF
	UCH/rI2Lqgn8n4uyBKWqNvhMjDJIR33GP/VdBvJ/lBdENpwuQ9zDqy
X-Gm-Gg: AYBFou3PjuGSfDp4cUZLtkQ6Jng4WO1NvlrsnV+vLxczTAsZwYCDoj02TRsHpFodn7z
	D5x3+zHeqVZhfn5+6D2rWgls2sOacHsCaIHUrXrTAigRCE6JgALGL76cORo0+CjXf13SRpPslrF
	Wz0hcJHg1rGoCdLFVMvzndjbjzLiQrM42/sm0ZsFu9jfCvoFtd+hynoprlzw==
X-Received: by 2002:a05:6a20:ce4a:b0:3dd:a196:906c with SMTP id adf61e73a8af0-3de0e906a84mr14829054637.54.1790688861840;
        Tue, 29 Sep 2026 06:34:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:ce4a:b0:3dd:a196:906c with SMTP id
 adf61e73a8af0-3de0e906a84mr14829018637.54.1790688861357; Tue, 29 Sep 2026
 06:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260918141810.3023069-1-peng.fan@oss.nxp.com>
In-Reply-To: <20260918141810.3023069-1-peng.fan@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:34:10 +0200
X-Gm-Features: AclHuK-HxDdPv6ZXo6bbLEOpc-R3pQ2RLvsBtUn3eOlCmwt_WjOTqzddYREOXeM
Message-ID: <CAPx+jO_L0HKe87FbLcM_VBEqrqz1gLCUwAV+ZE7CWU9v-d0vTQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Kees Cook <kees@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX3xR842GdVZD/
 QELiNmHS8r6MR4+mc2bl6PZcwNCbIzgGCRgFstD9yd4aqg9/ThG0JhJJ0cImfsHp4uRWA2HDn2Y
 8UFVy6Y7Zu76atIbBy23jiT8+VRBK8M=
X-Proofpoint-GUID: upJ5acXg89ptFDDcBLT56YaRXyZ2mrhy
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbbe5e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=8AirrxEcAAAA:8 a=4RwzDxXCS1lGNT27iAEA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: upJ5acXg89ptFDDcBLT56YaRXyZ2mrhy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX4VZRXQ+788Iy
 KbJSwmSSc9etU9cfV2XVQzqAWh9iM7WczKfGLTSEKsUV3aos446c1yDZSn1gwHoWQ97l04HB/JR
 GCpQo0EuaZgtmq5mQ7JHe+knxL2aU6e1riZpgsRYYzsA+ue9OwPEF75jNX42e3BCNK39FtdObbx
 ucY0e41fB1S6Q7KbPnJX8VIyfuvO2vIP9e7lMbrqseuk78rE3e04Nw3+9G+YlxsNHVZmT80T9i1
 DqjEijzu+TOFnv3agmf93InG8dOCmQCYf7F8XTlkZJTw861587jt+rQRme3vHk1L91S6zzG6Sz8
 PmH0p+qo6XCASfVyHoaZGrYmWP+VvPOdr9cdtOcSfanSdsY5YGjm3yFyiec2Ct86vSyAk77enJ7
 fcT2k58o+7MhTr2CKy1zYmW9CBS8+00yAKJ7GjHr743tUq2dIt7iqrFoxI6vWTdc/u7cHr4ORUI
 qx2Q6Tt9HXO2eQYkBOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_143429_130175_631818BB 
X-CRM114-Status: GOOD (  23.59  )
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

On Fri, Sep 18, 2026 at 4:20=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
>
> Done with Coccinelle semantic patch and manual fixups.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/atmel-mci.c | 5 +----
>  drivers/mmc/host/ushc.c      | 5 +----
>  2 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 8f4df250a77a..98933be5f174 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -1677,10 +1677,7 @@ static void atmci_detect_change(struct timer_list =
*t)
>
>                 spin_lock(&host->lock);
>
> -               if (!present)
> -                       clear_bit(ATMCI_CARD_PRESENT, &slot->flags);
> -               else
> -                       set_bit(ATMCI_CARD_PRESENT, &slot->flags);
> +               assign_bit(ATMCI_CARD_PRESENT, &slot->flags, present);
>
>                 /* Clean up queue if present */
>                 mrq =3D slot->mrq;
> diff --git a/drivers/mmc/host/ushc.c b/drivers/mmc/host/ushc.c
> index 7e8af5a06ac9..410e5bb62752 100644
> --- a/drivers/mmc/host/ushc.c
> +++ b/drivers/mmc/host/ushc.c
> @@ -388,10 +388,7 @@ static void ushc_enable_sdio_irq(struct mmc_host *mm=
c, int enable)
>  {
>         struct ushc_data *ushc =3D mmc_priv(mmc);
>
> -       if (enable)
> -               set_bit(INT_EN, &ushc->flags);
> -       else
> -               clear_bit(INT_EN, &ushc->flags);
> +       assign_bit(INT_EN, &ushc->flags, enable);
>  }
>
>  static void ushc_clean_up(struct ushc_data *ushc)
> --
> 2.51.0
>

