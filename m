Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BD2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=; b=T8qPKVAgHhQ90IjUU2KSKa4O0T
	a5HDfwpnS61nXefsEEghFmgJoTiPYhtQuNxFReBIpKfBi5CYlqYnaMcVxPdi5bNwTO1mTd2U7ZWwG
	IpPY6z6WTPNlTjt788oPRXU75JbgGEZorHf5TlOIOFGgkPxlVWB69GCDLPnO3uh2O7FjSnidcgTjM
	TM91wZJ4NHRQBC0YmLm6PLQg6kkwQD9Bzv1+OoTyn6Nn3WWR0x2+LSRAmN9AaLcZrVGqCgUNkfGxC
	UxpajrNi1su6ZUUITYlZPO1dhi2qptPXgMGhrxJvIp0fz4IFz4ZHnLGhfumzyLN30fOqIjXEbFnvH
	MYHTLUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcIc-0000000BwWO-0tXl;
	Tue, 14 Jul 2026 12:31:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcIZ-0000000BwVx-3W1H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:31:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBodHw263203
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=; b=Pc0ZlMeE/Tc18FPN
	qe3RnE7NymV3SObOIc4FWc/ZMmsgt36U1cCl8yZUhYe7hZglmy8uhaTuB/s83WLL
	Kq/EvZEn+mmdnNSoFutGXKKBkqoB3Uv/jXvuBI0/yfLbHb66Ig9BvOd7EICXkRyr
	Db7oeuQkryAz6x4aGnDLAZXZrPJ7nPmQKWDcxLvuPyjFkVKK3SjAfC+hV1G9mVbd
	oOv/HjEKt4KPkVMfGzAH1ex/t//dsLNli7HfurHC+BUpDUS33YPd1js6RPv9rpwc
	+yhvdNhoIErbIlzzMeQJRzgNAcVWj9actgAwf0vlMRtNwA8AShY4G5sDGs95XVkg
	Hu2hEQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk052u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:31:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e934385db1so76338776d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784032302; cv=none;
        d=google.com; s=arc-20260327;
        b=LfH2sBmqBuKA7n5pXtsBmfTHH2jRIjmHC8DiRSuBhhDjqHA3emDrTKh7e4vuqkbYLm
         hxbk9LloQeYH1XjTFOFW7hrUlHkWj68jUHvuDd66vDXrVrXcVpsm132CYZz9E0XwX7/X
         0bgSjiTGtomksOR6cUbS4qRKOkWD7nmp+1YOohgSiubO6moyJDgx2O65TDeLiIfAqrd/
         bJyQTmA6tNMaqyJcC1QkmlpdwjYLTipIAEsj1R6u3emr8Gnx9M+l2yPmGUlx4IV5Uvl8
         nBAKjljD0B0gTZ+pnAHljbx9kK87YR5fogryBW1zaldP1yBBRxqyNdA22oeiWddlRXY6
         JPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=;
        fh=H5DcxlcwsHshYnpEQe23yT5hddFGsicqFyhGsEQNNxo=;
        b=GBUg85TfhXWSOO9Mcft58OkWPTDyzbOfK8/u/GcDcdZx0C1rJMEFs3B6uybJIeRamq
         Fr4zZYTYUMN7Yk1UuhESz45FqtwUG++Hnt82fa9cn6yx9odQn4SVuq+s3XTXEd0jJQMC
         CWJX9YO7QrNLIIW5dYQHR3XAAFlFd9LgohKe0qgd4J2wrAfJBft0B1tjeeqxsuvt65cT
         a0lQIe4pPlxBlzXPv1p/ChsCBnUvIzW6ifTQGz9k3fBRYRUtqwqqB3Qj8Rt6HnrfIhON
         HAUnZ9kLj5ZHL2PwvJWSJ0Gq36/Ar+QnucvQPYyx2ysYS0Tq8MF87IIsOCcJSStu/I2t
         YEJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784032302; x=1784637102; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=;
        b=JCofjGCQnmY5mZRNgKP0Qn5XVQWMZq1itnm2hZWR8uluf1pXluXbzfAClL7mlONzmr
         7xKdocTzsghVf72GmtuguMXeyOFQa4ZvVF4GidAUoiTYXOmfGZVTEV2ljqhkOoL9fUOl
         MN3xmEkRJO/t844Uy/r64Vq9H79UJQ9xxKETZl33b1nBu3z02E7Y4DMAjA+chWs1q4p6
         MeX9pfkNHv7YLk2VIPXFBe3C96CUviXKAT/azd4laQuFOCLeAt5x3wCuOqxb8RrPGbMZ
         6aazNZYk7hwt+qbgNVF2kOfxme537eUQZSEjezuB3bHdnygqbAZr2zv74YXqoZ5jyGBy
         h4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032302; x=1784637102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=;
        b=W8D/AR7bIWkibwALJ2Ja7rMMt6ySCPGiSJUqyOVGtxpBW4l14e8xxmjWYvAVlfgCmF
         8GHI+/as8rRFNM8TcECwe2xuSgkjSs90e2FOAkrm8CIrvE+f77Vl84c3QyXa2UzW5DCT
         9oMH8SfjWBDKlVwHuTldjYujV8c0QDbkeKF+5RmwqB0sdeIeMZMc3kREbSc17KX+aF29
         5cR4W0RtlxRT7PNIz0ufJZkn4Re5p3+78ZkF312AFzFae9GWORX/Jxk2MmMuopvRatPy
         fs+3BX02k+RROE1JVaS34X58D9aFb7tNpS2rAIgGT4Z5BoQfeXBsmnVcUZmcEFt3FRrP
         WA3Q==
X-Forwarded-Encrypted: i=1; AHgh+RoWX7ajfXfDoCcFyYMKyWJWEgslQtd6TYrOQ4Xm0+Zw7wSWetY03KKK9sz07DjphrGfYqbPDx4XX8uRFK+MhUH2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl0dRN1vWf8Hw1ScVi9IiU4YG5oCUY2z1AtSayPbjKGJKuPaSm
	1ROrLnOlSRMDZV3f25xe9MjYJrwFDwcbo5mqFdKHWF+50VoTgJFrw2RxXJkgeYUTlMUovU1Q3Xe
	hvjadZR2mw1rOzxikV+KTlkkE5m/PNeppGXGc/70GwBtEYYGD2nXaosPzt9NGgiYXqshBqCu7mZ
	1i0xezW32gdUsYx5CM2nwh3620UjR3IkC8mx+YcXsKzoTB41zUT9QD
X-Gm-Gg: AfdE7cnLXbiJ1ZOrW2DnUU3R/ux3aUFRcn1/1ghYVE5CNRV902IefkVLdzfNAvLi3+R
	/WIVs5eZzJi40JCuLU2fijPX6eT9n8zY3EWOX+XpkghH25E+GSbH1v2ve3jStGjQLDTi1v5FyOy
	LZf7U3Zt/o60TTMtkPOd6uMy7jxdZfMT46Eem8TMEgmo5FBzDFKH4xYOasddBHa3s8J8pH
X-Received: by 2002:a05:6214:3385:b0:8fd:6e12:9710 with SMTP id 6a1803df08f44-90747d1cbf4mr35409196d6.62.1784032302402;
        Tue, 14 Jul 2026 05:31:42 -0700 (PDT)
X-Received: by 2002:a05:6214:3385:b0:8fd:6e12:9710 with SMTP id
 6a1803df08f44-90747d1cbf4mr35408856d6.62.1784032302033; Tue, 14 Jul 2026
 05:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <fce1aa52b181082f260a824fe38baf033ba8f56e.1783505329.git.geert+renesas@glider.be>
In-Reply-To: <fce1aa52b181082f260a824fe38baf033ba8f56e.1783505329.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 14:31:30 +0200
X-Gm-Features: AUfX_mw1w9aani-kekqL_J3mlM9LGY41ZFq3mfPK3ex6sNHNGM7Yu8pRBTDGFLI
Message-ID: <CAPx+jO8W3MdqnJ-4EgbmFvODuX9BGcyww=YRn=_CknohfSWOjw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pmdomain: Make genpd_get_from_provider() public
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: qhIkmtf9Osp77PltN5Vtfk65jRUMazcC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzMCBTYWx0ZWRfXzDN2JuUQhsCh
 zfpYWdgh24KO5SP0K9OjJnm3kWIf7RZH4BWlr03QjwN0Zj8BAlk8RbWXN/i7NYJHV2hvHV2uaDL
 f/JblQZQtc1xZXxXpPW3jpLpG19SUdNS+c89qBMvz6z0HGYL0wU/TR21vbeYb/GkZBCGjIbrw1I
 1HU8qKi3auFYMPCpzsLu99KJ7FwTlfU/fzwt3lHoIhs7ZMVBEgsWfR5o/DSwqoSIKj0qIgxy7vz
 3ZADNahksaCZzth2/GDVTvtHdikdzPDx0aOulujn7TUWJAGsHTNVt5T5s46oNQT4bGnmc4A4q1o
 TPFYE6z7xQxTnr6WVksYjqgrJ8XBYFsVfoFnO+j5YIOzeeUHdGA0jvE7wUJ4vEpkPZNxBCVDPx8
 fhkZOerRfOTyzhmVMygFrb1k7V2h7zfotDhdif2hJCLtEYkzWXNDA0W5wYGbS0oLeRvCAFHH0oE
 fWi5nM4lnll32Mp6qVA==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a562c2f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=BvHvEDz1nzgFWKTw3gwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: qhIkmtf9Osp77PltN5Vtfk65jRUMazcC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzMCBTYWx0ZWRfX5YAptqr9ULOI
 r/PhX2Q5c1OKMMBaffpSbdVtezSSDPNWqOTfxzZqbzWKFsJUkCJzjisH4ZV66EFupnL6HLskNJM
 sSEzpu6TecAm79oobpOXYMiM/yvxlfg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_053143_881907_B7215231 
X-CRM114-Status: GOOD (  27.79  )
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

On Wed, Jul 8, 2026 at 12:17=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike the corresponding function in the clock subsystem
> (of_clk_get_from_provider()), genpd_get_from_provider() is private, and
> thus cannot be used by PM Domain drivers.
>
> Make it public, so it be used by the R-Car X5H Module Controller driver.

I am a bit reluctant to make it public, because of potential abuse.
Moreover, there is no protection or reference counting of the genpd
that is returned, hence the caller needs to be careful.

That said, if there is a strong argument that it's really needed, I am
fine with it.

>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - No changes.
> ---
>  drivers/pmdomain/core.c   | 4 ++--
>  include/linux/pm_domain.h | 7 +++++++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290677c..7de3c693ddd9a2c8 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2900,8 +2900,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>   * Returns a valid pointer to struct generic_pm_domain on success or ERR=
_PTR()
>   * on failure.
>   */
> -static struct generic_pm_domain *genpd_get_from_provider(
> -                                       const struct of_phandle_args *gen=
pdspec)
> +struct generic_pm_domain *genpd_get_from_provider(const struct of_phandl=
e_args *genpdspec)

If we are going to do this, please add "of_" as prefix for the
function to have consistent names of public genpd functions.

>  {
>         struct generic_pm_domain *genpd =3D ERR_PTR(-ENOENT);
>         struct of_genpd_provider *provider;
> @@ -2923,6 +2922,7 @@ static struct generic_pm_domain *genpd_get_from_pro=
vider(
>
>         return genpd;
>  }
> +EXPORT_SYMBOL_GPL(genpd_get_from_provider);
>
>  /**
>   * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index f925614aebdbc914..95fd7e63e87e2095 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -458,6 +458,7 @@ int of_genpd_add_provider_simple(struct device_node *=
np,
>  int of_genpd_add_provider_onecell(struct device_node *np,
>                                   struct genpd_onecell_data *data);
>  void of_genpd_del_provider(struct device_node *np);
> +struct generic_pm_domain *genpd_get_from_provider(const struct of_phandl=
e_args *genpdspec);
>  int of_genpd_add_device(const struct of_phandle_args *args, struct devic=
e *dev);
>  int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
>                            const struct of_phandle_args *subdomain_spec);
> @@ -492,6 +493,12 @@ static inline int of_genpd_add_provider_onecell(stru=
ct device_node *np,
>
>  static inline void of_genpd_del_provider(struct device_node *np) {}
>
> +static inline struct generic_pm_domain *genpd_get_from_provider(
> +                               const struct of_phandle_args *genpdspec)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
> +
>  static inline int of_genpd_add_device(const struct of_phandle_args *args=
,
>                                       struct device *dev)
>  {
> --
> 2.43.0
>

Kind regards
Uffe

