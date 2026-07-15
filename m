Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E64C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0s4UvEQjbDQF2ld7XgN78VAO8eHi8w7IlIEUGbUVuOE=; b=MClhtMGZGVHP8T3d9j63L10OZt
	4AjYohztSfelDJOYjp8AK5f4t6WOBhTTyZLsG9Mog5XSfbWms4RBL6iqKhnhlZvSEO5UcH1DWY1BM
	nhzxNpr1SwYliN+mibLVcTsrPHI+4V2MUXVLOfwY0CWyUoCbaRXC0vrU8uCIXlWdOYzCqpbz9LdPo
	YQUX3Hg1pU/u/PDqPwcpaeX5Y/Rb/Yej9tEfgGcOSrzPq5IBrb/Xg7fZGW39TCUE4wgxPrUVkEAoE
	vO50hh9zAtlGlumA6WuzWJ+Xd0ta3rYcpzp+eC67U1j2aAlWbYYIHckDeDZ+UsW5NgOA3D53qE85i
	XO2uBi9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvbn-0000000EGgx-0VM0;
	Wed, 15 Jul 2026 09:08:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvbl-0000000EGgN-0PPO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:08:50 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F7mRAP3142996
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 09:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0s4UvEQjbDQF2ld7XgN78VAO8eHi8w7IlIEUGbUVuOE=; b=MjQO47h+G/ky7ZP/
	j8kG6VyYVGzZFEz0WuFuA2LE+aszAqo8E9xYzqvtH/YTc0CVYIcrbQUDuTaWtTOe
	5x/Ik2Q53EXNmQNwh75UcicAiWj7r9fOCRfiqs1A5Ix3169JSJ1BrPO/gXRKlbTO
	CQgbl5qUjuMFP9sjrGIS1TctXo0sLN852Tn9f/kkx3jsWF6QdsaGD+IPjsnpsjgI
	UweFeqhupPuq/79C1BdHUIQVST98Nu3PiznsbWFL8oPbkbaWHc0tn+kjXXAVIU5B
	hmusFKhgTHekiZSeY7vtZxQ6z+00N4ljAIP+iOzuf2A9b2dHr7F3JntliOgYj3qn
	A2LVYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe65289mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 09:08:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6a2f5995so844392485a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 02:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784106527; cv=none;
        d=google.com; s=arc-20260327;
        b=h5jq2Y7FVZHSiGu7HqPWYxgvgpX2j2tCfNgDwCpd8/V8TGwDCbFEj+yLYK+UPo8wuA
         tPWkAzm2+n/Avn5ASRjqI3OQ39unzff0ksQmjysEVUnazE9OmmE3lYSeqzrXvcH0P7xT
         ILEJvQilf1PDwxRf6lVKlJNicG0DmgmZ0SkVFbv4ehMNo96pgYHxj0YnzzjebQO+/4Tk
         MatkAz7ZhCqx03YYL7zdk3pdOt2swXbfdrwDXMXoiWVYsnbJe/tOrY6Vg/J0+VcEIUZA
         qlQrF1Aphd9yUFJxHkNmMh4DmpQ5JCSvvF1rLnKE0Noizp05YDSN1hELcpvo5Uq9jHRP
         CbiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0s4UvEQjbDQF2ld7XgN78VAO8eHi8w7IlIEUGbUVuOE=;
        fh=FAS8XfkQclshsgKqLR5VoA2HmZNJ9MULz92WsUI5IFk=;
        b=nCjqn6gHP0L+XwU30WS8Ld9UNwceHrg0OrlqmUoTVhdq3RaugKEmr4dvxgL96lmzcO
         ZKBObGGEXyM9hmhjE/hyFMAACK86uCiypNiVsn1iFtcK45WN3Wy64LfjHGsLxGgnU7aJ
         G8/OBuc2yIX0osl04A87q3DJ570A4wRgnXJZ7tD41ibNwfFSugF7A5CjF27Cs7jW78DT
         hWIVk6RtvJMsu9rgHx1+45QchLE1tPC4cOBeZzPqPmk79NJbqQLMXi8lQxImaQnG5fUM
         53S0JubueEnaDY6FCIjQWIxpIYIJM+XlZRWl27WwpWB4w5YtvDntAo4/aKdSyyqn9QY+
         MODA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784106527; x=1784711327; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0s4UvEQjbDQF2ld7XgN78VAO8eHi8w7IlIEUGbUVuOE=;
        b=OIjtvcq83ejqZNPTWcsi3UrYgQPmTuttxL0sl13GmQth2cFvkUmLwqIxasAy8bn14k
         MNMzgfj2JDLIzLlr0jOalF1t7NVfJIsvQ/7VX0BkR7TnyAnA7DT9JbR/VKZYQjJNbyfo
         L9LnHKzCG6IKJ6OvBtGReEBnrMHz4w6cX99yYI3aIP5iSX3nSeoAjIWVAMEoFsP4/1bT
         5VUgjQil91ak6ZeIYLJF7LNde14WaRXo3gGnYCqTxwY+GqasfkCP0BUsrcm20YsjIQUP
         Yo8mmsFaopacj0I+k0C5I0XU1Hwvo8aJhNPUgzR6wl2PRC6GcllJulA6XAcDUIoZwgYr
         WV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106527; x=1784711327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0s4UvEQjbDQF2ld7XgN78VAO8eHi8w7IlIEUGbUVuOE=;
        b=bpWID6x28HuGQSxsSZ9laai9BYoc4YSGetKpa5XnrxMjCBb1X5uH0KUd29Xo+Bu5kd
         Mg8tckBlMGYWU+AzBrn6MflAc14IGWb52G+5IZJt6ZsKLx9GnxXvfl8er/YB7FNAR8Em
         q4KvhE94Vln3bytpqf2Q7kY8GPI0LsLsnZS8c+iy4nuhdjc4Wo1quuvyKw7hvP9tUs3Z
         LJ66YNNr4TN8Hz5n1vSTwIbxvVZhMjZD1GGnvfecwVpKt1acXopu1tfvNLC4G/dU14bX
         zPRcs+aMgYjMVwKwE2LdQ3B7+K3GKVIiuwzbNcfeEvYkaq5KQAyTEIYA6efGuc7CrtvY
         V59A==
X-Forwarded-Encrypted: i=1; AHgh+Rq854T7u5u9eJKjKNtXfp6peUuLxMc7i7ayMxLhoTdMRVpe6LNRQmRQLoMEARcKkVhN1ehHLQQVcDUZPlzXYqoF@lists.infradead.org
X-Gm-Message-State: AOJu0YyXZOmTK/YmdZVB9Ysl2Eb3WNKUjT18XFG52PIKFhtuBmC++rAN
	PyHHgnrGtYAakzJ8kd5A8ukjjJhXttICR11W4V9LqTbueUOTvdqkViZ/Z/aXagTkI6twat4jY0P
	b8l22UspF9VWNKFzVIfRBs+s38yi/ERgTNW2y0cFfVt7LJaRx+W3i0fFOjd8uhl+a/LE66+aOmi
	FpivLos1hQaXdfKXRAomVBL8Y1ykNR4UATAAWvQtTEnvmsdt4cqhkZVAvE6bv2
X-Gm-Gg: AfdE7cmzR6YygHHJzHkBJsSpKlN7T+VxohAsYAAQSsQFiD5wJ/b+mJcavIkbZOEMIjO
	ET5hpqlShGyxG3H6cFDq5XZLgHd6I7aBenVNd76BCe+/GopAJ5McxPshK73FTXM7kn4qpc9ANwz
	ih0lnXQJOn49gV7iWJ4UlhKxrMEwec9OhVBhvywTy5z/LIreWL/TqUrLresZaQ6cHUUkE=
X-Received: by 2002:a05:622a:124f:b0:516:d612:d1c4 with SMTP id d75a77b69052e-51e4f0a754dmr18899801cf.52.1784106527443;
        Wed, 15 Jul 2026 02:08:47 -0700 (PDT)
X-Received: by 2002:a05:622a:124f:b0:516:d612:d1c4 with SMTP id
 d75a77b69052e-51e4f0a754dmr18899531cf.52.1784106526991; Wed, 15 Jul 2026
 02:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
In-Reply-To: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:08:34 +0200
X-Gm-Features: AUfX_mw5_zd7FHkNF2aqrnmGS08lBZtf204AnFVjvOZno8cszHuFFX58iO0JEgc
Message-ID: <CAPx+jO8LALFoiB+7JkNhG9D3e+DN+D-iM0qL0T=UAw=BTouN=Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] mmc: sdhci-esdhc-imx: fix SDIO suspend/resume issues
To: ziniu.wang_1@oss.nxp.com
Cc: adrian.hunter@intel.com, ulfh@kernel.org, haibo.chen@nxp.com,
        Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, imx@lists.linux.dev, linux-mmc@vger.kernel.org,
        s32@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA4NyBTYWx0ZWRfX4ILEBDm4YVAA
 C54Ao8iQVBUGUmWpEBno55Y1hlnMtUwe6A5dWMcauVaDjqxsCdmaEMBXOkCA7PEXy2D6RZXLLIW
 j+UKYdhR5Ei+Yf1KurJr6HUgDd0+KGSXfaI5USHmTjpwNaRBI/qbXiZP0YCuPYIAlxOqv7GTBoh
 cYWQrCpBNkyK1LKKI5Jue9Fa6eKMAFfpC+kOvxqlZnoEsEke4Sah2LnZho89c3CpIPVvNfAegFY
 mMHqAU60uIchbT9Sw0pmKzF5ibj/zlBJtzpzkZhpnRp+lpigOzNZR+5zTc17fsvUqgRcCLS7l3Y
 5sGnDjav/4uSHTtcykHhah+OHjrBSVgRHBFx/rZDrwkmrJugko8q4jmI+rsQMk2D49jlMyHguMi
 F4qmY/dLUmaG7SXZYK+FHiLuUHQoFFFe9+/wswPHybmIzAU1GmvmhEknRkg0GH01RGLCfUtF124
 lnJRvZf9OfpCKyMpHFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA4NyBTYWx0ZWRfX//9ZgAghyQXV
 ndGzeODOZC1eY4ypYcb38qjGWOlumZ1f3dOfhmdbaXq0ftxgZkKPevsSxfZX7+XFCY/0uPTg1n5
 gNb+hu1k9WqO8dHdW76yg/nPrLRNBi8=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a574e20 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=8AirrxEcAAAA:8 a=j4ls_bG9junj-QLuZ2QA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: SPh3uCMCWiLiulYqxZkrn_BdiGgWyfdK
X-Proofpoint-GUID: SPh3uCMCWiLiulYqxZkrn_BdiGgWyfdK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_020849_147605_6AFB8618 
X-CRM114-Status: GOOD (  24.31  )
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

On Wed, Jul 15, 2026 at 9:16=E2=80=AFAM <ziniu.wang_1@oss.nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> This series fixes several suspend/resume issues in the sdhci-esdhc-imx
> driver, primarily affecting SDIO devices (e.g., WiFi).
>
> Issues fixed:
> - Tuning delay values not saved/restored for out-of-band wakeup devices
> - DLL override lost after resume for DDR modes
> - Pinctrl not restored before DDR_EN is set, causing CRC errors
> - Unhandled interrupt during resume causing "nobody cared" warning
> - Various error handling issues in suspend/resume paths
>
> All patches now carry a Fixes tag pointing at v6.16. Patches 2-8 fix
> regressions introduced by commit 676a83855614 ("mmc: host:
> sdhci-esdhc-imx: refactor the system PM logic") in v6.16; patch 1 fixes
> commit c63d25cdc59a ("mmc: sdhci-esdhc-imx: Save tuning value when card
> stays powered in suspend"), also in v6.16.
>
> Changes since v6:
> - Patch 7: Drop "ret =3D" for non-fatal calls (sdhci_enable_irq_wakeups,
>   pinctrl_pm_select_sleep_state, mmc_gpio_set_cd_wake) so they no longer
>   touch ret. Call them directly in if() to keep semantics clear and
>   avoid any risk of a non-fatal return value polluting the fatal error
>   path. (Frank Li)
>
> Changes since v5:
> - Added Fixes tags to all remaining patches (patch 3, 6, 7, 8) so the
>   whole series is properly tagged for stable, as requested by Ulf.
>   No functional changes.
>
> Changes since v4:
> - New patch 3: Fix esdhc_change_pinstate() to move IS_ERR checks for
>   pins_100mhz/pins_200mhz into their respective switch cases, so that
>   legacy timing modes can still reach pinctrl_select_default_state().
>   This avoids log spam on resume for devices without UHS pin states (Sash=
iko)
>
> Changes since v3:
> - Patch 2: Remove unused 'boarddata' variable in esdhc_set_uhs_signaling(=
)
> - Patch 7: Expand commit message to document intentional skip of enable_i=
rq()
>   and sdhci_disable_irq_wakeups() on early return, and explain why the
>   PM runtime usage counter leak is acceptable (Sashiko)
>
> Changes since v2:
> - Patch 3: Updated commit message to explain the SoC IP integration
>   detail about internal loopback path change when switching pinctrl
>   from GPIO to USDHC function (per Bough Chen suggestion)
> - Patch 5 (v2): Split into three separate patches (5/6/7) so each
>   patch fixes one problem (per Frank Li suggestion)
>
> Changes since v1:
> - Added patch 5 to fix error handling issues identified during review
> - Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
> - Make pinctrl and cd-wake failures non-fatal (dev_warn only)
> - Use esdhc_change_pinstate() instead of pinctrl_pm_select_default_state(=
)
>   in resume to restore correct pin state based on timing mode
> - Skip pinctrl restore for wakeup devices to avoid SD bus glitch
> - Check pm_runtime_force_resume() return value in resume
>
> Luke Wang (8):
>   mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check
>     for tuning save/restore
>   mmc: sdhci-esdhc-imx: restore DLL override for DDR modes on resume
>   mmc: sdhci-esdhc-imx: fix esdhc_change_pinstate() to allow default
>     state restore
>   mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on
>     resume
>   mmc: sdhci-esdhc-imx: disable irq during suspend to fix unhandled
>     interrupt
>   mmc: sdhci-esdhc-imx: use pm_runtime_resume_and_get() in suspend
>   mmc: sdhci-esdhc-imx: make non-fatal errors non-blocking in suspend
>   mmc: sdhci-esdhc-imx: fix resume error handling
>
>  drivers/mmc/host/sdhci-esdhc-imx.c | 91 +++++++++++++++++++-----------
>  1 file changed, 58 insertions(+), 33 deletions(-)
>
> --
> 2.34.1

The v7 series applied for fixes and by adding stable tags to all of
the patches, thanks!

Kind regards
Uffe

