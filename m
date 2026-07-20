Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF901C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4V1kLYIy9VLaH4izcRngdk5f4+oVLN80Pe1S3oyCuaM=; b=49bckp6OMPRTqG3/rPsgFuq6PX
	Ib0ZHPKE8x9mWhIhAfj/7iIxeF8TzDYs8W7T9y9peWtImHzPtC0y+pa5vsonPTd8nWijVUhVqG3FI
	dWfRzWEDaTty7iB5KAU2SaXY7reuaDeNsbJl8lpqPCMRc8L/zmThB5nXDquEtFtQkhxXYpyyNmovY
	MEp7cGb8nPwMGTHzem26x2bbLRs4s4BAN7+WDityUkDywbjCllKKQVF9sHVX6zAiEEWM2q+Xar1zM
	lhOWeVvahz+hZj1weQGBbWZeSjACXbyNkrmHdf+eNIbquePgt+gKXriHbhhKwTsOfKjD2dvOD3Zu8
	dJx/D3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqUj-00000007J9W-2d9z;
	Mon, 20 Jul 2026 16:05:29 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqUf-00000007J7f-3Ae7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Cc: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1784563522;
 bh=4V1kLYIy9VLaH4izcRngdk5f4+oVLN80Pe1S3oyCuaM=;
 b=IXPouiTI6OJpt/VfNNm/vCrXDfC4UlwCFy1QfMbtq+AcGKNYG3hH/jgIxYqN1nyDpx0sixR1y
 Bc/x/YS09l9xE/siwcegzJxsBZTkX9GneVtPxaTmI/8/mk6I/tbra0Lmxdtgva0oOBxPwcsXagE
 YLIGypYq0LGUWpZHxr3BAF1OlsEA7NAHZT6FHb4DBW9YwF3PbIPIHBS0/EKGnl5flIFAN01ja8e
 EOCgnTx2fHmP2jS4noWFHTwTeKPsW+EPsK2LODt+39berC/PTC0ebcRhZUFl5NXGO5bcbf7o1BR
 f/D9H/BEHxXJJrtD216z3GM4PI76cNC2UTmNe0rd++Yw==
X-Forward-Email-ID: 6a5e473e79814abe71f8e3c1
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.11.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 20 Jul 2026 12:05:17 -0400
Message-Id: <DK3IYY2FP62G.2ZOAUMLYJP77P@ubuntu.com>
Subject: Re: [PATCH v2] cpufreq: apple-soc: Calculate frequency as a 64-bit
 value
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sasha Finkelstein" <k@chaosmail.tech>, "Sven Peter" <sven@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>
In-Reply-To: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_090526_157918_3CE61B5E 
X-CRM114-Status: GOOD (  18.41  )
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

On Mon Jul 20, 2026 at 3:25 AM EDT, Sasha Finkelstein wrote:
> The current frequency calculation is done in 32 bit, causing problems
> if run on a future SoC that can boost higher than 4.2GHz. Ideally, we
> should use a true u64 instead of unsigned long and "knowning" that this
> only runs on 64 bit machines, but the core code uses ulong everywhere,
> so this should be good enough.
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v2:
> - Minor style fixes
> - Link to v1: https://patch.msgid.link/20260703-cpufreq-64-v1-1-c406c7053=
19a@chaosmail.tech
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-=
soc-cpufreq.c
> index 638e5bf72185..5ad274a1e6ae 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -288,7 +288,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_poli=
cy *policy)
> =20
>  	/* Get OPP levels (p-state indexes) and stash them in driver_data */
>  	for (i =3D 0; freq_table[i].frequency !=3D CPUFREQ_TABLE_END; i++) {
> -		unsigned long rate =3D freq_table[i].frequency * 1000 + 999;
> +		unsigned long rate =3D freq_table[i].frequency * 1000UL + 999;
>  		struct dev_pm_opp *opp =3D dev_pm_opp_find_freq_floor(cpu_dev, &rate);
> =20
>  		if (IS_ERR(opp)) {
>
> ---
> base-commit: 4a50a141f05a8d1737661b19ee22ff8455b94409
> change-id: 20260703-cpufreq-64-2a23d7261e09
>
> Best regards,
> -- =20
> Sasha Finkelstein <k@chaosmail.tech>

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

