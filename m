Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6932C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HP0PounhvTOT7QM3qBV2FFDGxTR319Vd78MIDrgPsRY=; b=2WEb9i6F5ofXlg3xSINn7nDOcI
	68elKKW4je0Fm8yF9VkcCpJEkcrTgwbd2FoTpt+tr05GQb8uodUdCBlCcuzzMhtolc6+O5tlblWh2
	0o1tTEj/cIutOeJd9sigyZ5gLiLQEVbafk0vOo7zRVYA+HNlJVE8p0uGK2uRHDDzJVyFzBHu67rbI
	JZLDSIPdcKfNJpVB3dLy5f0aZSzc/kaU77gO6eLZgFAgMKqKk4Gd6It+wstSBPKDY3UVZcw0LvF2R
	NtSOF7U388flmz6TKYGKYrLl5dw+eRsjEoR4xHaN6YBXDX7mWNpDfo1Lqaohyqi7G1HcxjHKxmhz7
	wKnHvStQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFQO-00000001xKW-2HpL;
	Tue, 04 Aug 2026 13:43:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFQL-00000001xIs-2QjC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:43:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674D33PF3693373
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 13:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HP0PounhvTOT7QM3qBV2FFDGxTR319Vd78MIDrgPsRY=; b=IqQf2b4FGejs2nR+
	xCaO89bszLEgViAVstdoyjObZOHo9Q6KAuJMds07EbDiagts1JLhGNO3ehpkKDfs
	txvP/OubxAvxsmP1lpDNO4GXLvE3v6mg3Hpctrjx9iDdLFCxBgr8AFlv9e3Q2NKy
	MaI4IkZ0l4HInpJdJz9CbvzVFCal7cZITELDDWVnhrSTskzEo34xMiF9whvoNzZh
	h8g+3U86nTxHYbIEQ2lIgJEYTZdvbCUy3LlilKLWGjP3w7WJDbmi0ltwKaGdkvaq
	zDRzsMpkylts17Gi5H+/I60QhJPE4BCk3EpZikjX439PSdsI7LGk6OSztcRGqn0e
	R1+kRw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmgg5e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 13:43:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso455163585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 06:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785850996; cv=none;
        d=google.com; s=arc-20260327;
        b=b+YU9ZjN2RJS/6OAV36msRKWibvo+a5HTiX4XH1WbiPUqP++xUPtY97eulJ6zSio8A
         SEqFWrHxkkVv4AOWzDgSlMHSrSWdDpl9kjklXilcWHjkuVg7KZBUozuej6dSEHxR5Nyd
         lrCecQWlvwWJNIcApzj+INodXxJnfpasOqXHWwN6HPcy/r5x5q/MtwXH/XpXg2xXfmw+
         9uukR92gKlkhmsTwRt2Pq0GgGOlvG8o61G8zSJKYz+IeJ7aj6ILM16dBh35tKs1Hl/od
         Fp2UCDAvsvbnUqnA4jPsn2BcUBdQBbr6xXPe7jqdvvPtSSfWjWNzqUAdHxLp3dBI3RqM
         jIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HP0PounhvTOT7QM3qBV2FFDGxTR319Vd78MIDrgPsRY=;
        fh=Ebtug8ew7z8HSKqdOjzmuSW52zPZtTqRm4ACh6+5dpo=;
        b=skSKiPxB6/hs691ZE7EawQfUet2ZnF6mYoS3NmV2EmoDbJmtjEbTLA2LSB4UyT0FcM
         ASnBPnjZXPu3b1lwh05TZ7W+VX791jtqsKTvsQHKr3zykRGV2LFQpePKLaJ8vSP8epnl
         Fcq4R7DaKdRFncB9m5K3i68seWJ8R/f5HlQLTBmiasmNOs0v8P4AHR7iiQdkJ45qwTy/
         v9DIWiA+mQU2+1NVYBQk5+ct7alkeRw+wVaz3M/ZzrxFL34G1IeVgviPRzL8KDF3MLnV
         EcO+aLkf8Y3zeBLA/4DXK1DRHvC1Y7lWRpPWEWYYsJsyx/2hyDsEVQ6mUwOpFqOLn7fc
         QGzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785850996; x=1786455796; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HP0PounhvTOT7QM3qBV2FFDGxTR319Vd78MIDrgPsRY=;
        b=cZaqHCIEs4XDpmFdW2kyyXXVCCBTM6PUsYb8LUauQCMjmVM8ihIqUCEaVdBbs7gTdn
         OPZbydgZAHTmkpK7+eKrkt5diWiqe5TmveZsGxnTT5OL01Fa3YL0am71TBguVEnQTIUm
         DhFvc/DZCMjri3kD/tojZIS+ZlQA5WOW93xFMNf6cBQ4vco9W9mChV1VYlSMWnQDSaKM
         oLwhd+UINJPO93NnMlCfPKo3bsoQtqxyKbmV9kBtTgyGo6HL3/vdX0rVyfsDUZJeoBhW
         6FKx/C6e0NUgwz5WJ46HvoxXWrWAWnl1vv0Ddkwcd+6P19yIP+ZbwM6wzjjGeE0pTNss
         bKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850996; x=1786455796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HP0PounhvTOT7QM3qBV2FFDGxTR319Vd78MIDrgPsRY=;
        b=B/3/pAlxs6ooNx3XqRJ+tsjaNOsmp2z70lz72GJBKD+m9Ya5x6nRjYEp0QKMfFlmi7
         7L22SGzb5MuUpn07OZ4DMfXTUkmJ4NTJj+95P29ALRS+OR8EAOjcQIMaVt0Wthr6x5hp
         KYn6Gooz54lcgAp12O2xvdU1cidFvr3zXAuggZSmHcQ7KxJ+3mNQhyReO6ONWcltjUrS
         GxanSaJ/Vq1By4sTiVs89U17SSoMZLYeXxx/bWhm8k+ikB/DAxMkC9vfTJKUqVZ8wJ4x
         WxhVXgP6sLP4VGMfzi5sfdAvXn1Okxfovt/jzoyrEA2m/YFe5VJkbrFK0OlWU5VWsvoE
         Hf2w==
X-Forwarded-Encrypted: i=1; AHgh+RphYPSMtuk/+4rOMxS5W5A5E/kycLY6Anygog/NixykRtWzlTAPKajeLRbRR1Gnc3WA+zjYY8f1JClo70Jewh8G@lists.infradead.org
X-Gm-Message-State: AOJu0YyMP9X8XlsfLnlMEe5V9ixc7AWjXAQN/n7hXQZs0mMRex6jVCz+
	QYZoukltVUNaBG368KZiuVITNzhqj27RbIlthLn6Lt2eWfxTUFcBxRZjjs8fw4qVINzv1h4GDzz
	Js5Y7jcPVIq/IBPioEJj4Ae+T3nnTJkqiQIrnZPEEfv1NrtZZhrHTzDAKvdGdQTqcTabnXjIxUe
	QTUtLj4h/jMGtByWD9+d1ztQx+WJ0Xr631IB1VUrNLNRI6LqsHmxbT
X-Gm-Gg: AR+sD10i4VuyaE4wKCGtb6MtsZEZ894uETJ2gQqHkh7l+KAXcqGZZAAlQNk6vPiVJIH
	93/Wj30kn9m4OD3vM/jsa1prsQRtL4KnPkxmJW8bLfza5WpdeT5p7pe34QRMnlkVH23mslOLc3e
	BHOWaJVvYqWaBadnvLMg6qOEIDfYUq90x4RikQedijblyBhs79zGiFljI4+g==
X-Received: by 2002:a05:622a:1214:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52b56777af4mr253152831cf.27.1785850996101;
        Tue, 04 Aug 2026 06:43:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1214:b0:516:e0eb:d7d with SMTP id
 d75a77b69052e-52b56777af4mr253152271cf.27.1785850995665; Tue, 04 Aug 2026
 06:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <4389d5deff90b2b860bd07f17668270fda36bd26.1785750407.git.xiaopei01@kylinos.cn>
In-Reply-To: <4389d5deff90b2b860bd07f17668270fda36bd26.1785750407.git.xiaopei01@kylinos.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 15:43:04 +0200
X-Gm-Features: AUfX_mxpZumxWFxMAuKE7eioaXJu4G1kpmXiqDCFMMd_83LH_LCczGYOGtylrhs
Message-ID: <CAPx+jO8s+ANURyMRTbCa+EA54-q3wMS_hZtOJdxOucg5eRBk6Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: atmel-mci: Fix use-after-free in atmci_remove due to
 race condition
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: aubin.constans@microchip.com, ulfh@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX9jCy5Oyn9kkv
 fel70wY7q3oOD1I4CjlYgMWBJ7hkzWl4F9FPtQEUuW2uPWobOFypm0tqPkxbgResig8w53opAbJ
 Hpjcme16tkxVqC7ywQGUC/ubkwomSsr8AH/SGMtJPeGkzVMoUYM7zKsbeCefWFHP+zGWziEDfi9
 ZkVirOkT4eZHlcqqqmRTrHOIuen+yxrplewMqvwsLrFnjebjsayGHc5ZW0gTh8lKEO+XESF1BDq
 fQXAk0hg7UeyFt6jA+zflyV/Jt76WNIQno1oKjEoO8a+uoMAC5LWXDbYmSyzZP9ydCoyhPqdgvp
 0HSUkD6AvSO3TnmKRprCITbAF31d/zOMqHn1xcbqnnmCswXkcI0XP3BmX3yBZU4Kcipoe38Bplo
 KIiNUmYdOv34SLvofMQkSIPqWngNZQfgPZTrqYpIIPMcJ7fu9m+CgK76vSU1Weo6LxxsmL0/tFP
 /LZVhsRkdc04LynJhzg==
X-Proofpoint-GUID: _Usz8GoBV5ACdaZzHGvCHPYJH7tOYYNW
X-Proofpoint-ORIG-GUID: _Usz8GoBV5ACdaZzHGvCHPYJH7tOYYNW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX6R9/+0MInqO+
 n9gTMeVUzLB5fkAMf5yhCOk0EnPXXlfj8U0N1ulxJDZBPQR8hDElj+YyXyQGK9u3He8m8N3HzlK
 YwK4/1BMSoGbWXOQIhTuoPQGpcCrAHM=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a71ec75 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=BBGR4qOFYMu73H6LvdUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_064317_629257_56B3941E 
X-CRM114-Status: GOOD (  24.69  )
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

On Mon, Aug 3, 2026 at 11:48=E2=80=AFAM Pei Xiao <xiaopei01@kylinos.cn> wro=
te:
>
> In atmci_probe, &host->bh_work is bound with atmci_work_func, and
> atmci_interrupt, atmci_timeout_timer and atmci_dma_complete can all
> queue this work on system_bh_wq.
>
> If we remove the module, atmci_remove makes cleanup and the memory
> allocated for host with devm_kzalloc() is released after the remove
> callback returns, while the work mentioned above may still be pending
> or running. The sequence of operations that may lead to a UAF bug is
> as follows:
>
> CPU0                                      CPU1
>
>                                           | atmci_interrupt
>                                           | queue_work(system_bh_wq,
>                                           |            &host->bh_work)
> atmci_remove                              |
> atmci_cleanup_slot(...)                   |
> atmci_writel(host, ATMCI_IDR, ~0UL)       |
> timer_delete_sync(&host->timer)           |
> dma_release_channel(host->dma.chan)       |
> free_irq(platform_get_irq(pdev, 0), host) |
>                                           | atmci_work_func
>                                           | // use host
> // devm resources released after          |
> // remove returns, host is freed          |
>                                           | // use host (use-after-free)
>
> Fix it by canceling the work after all the sources that can schedule
> it (IRQ handler, timeout timer and DMA completion callback) have been
> stopped, and before proceeding with the remaining cleanup in
> atmci_remove.
>
> Fixes: 7d2be0749a59 ("atmel-mci: Driver for Atmel on-chip MMC controllers=
")
> Assisted-by: Codex:deepseek-v4-flash
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/atmel-mci.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 3b4928f5b9b2..8f4df250a77a 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -2610,6 +2610,8 @@ static void atmci_remove(struct platform_device *pd=
ev)
>
>         free_irq(platform_get_irq(pdev, 0), host);
>
> +       cancel_work_sync(&host->bh_work);
> +
>         clk_disable_unprepare(host->mck);
>
>         pm_runtime_disable(dev);
> --
> 2.25.1
>

