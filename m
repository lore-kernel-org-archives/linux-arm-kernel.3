Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B94C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqepJk0Mo2biIWd5IKYSCeDa2QQNS/dPcnLon1EB8CE=; b=njX/N7sfBaFdctBjtbAJqDph65
	b5MYXKzVvKn24gODqwc3EelH4n7CPXMrS0GvLQXfZYmDZn2+8shGmqsZah9YSXrqlv3rHx449zlij
	Tztzlxj9VM9oWPa2asaPaiZwZPCIXs455qt2a753s/XduPTayJYrKglTl3o2IsbW0ZUKy8Vy+dsf+
	E/XYTlbebQYypto8JL52NxZisGcYUJlY3f8iqeDIoOlHtj9yMWErmXC1OGiZgzzoJ1xaEqFRG7aWS
	ubbJr+f4wD0XmnVtpARscLkIo5aLTZ0qShiLm+aq2/UmMAg2gWtB6ZkOW7mfmk+eYzWoc+ah69fUi
	e+EdNcgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozoB-00000007Fj7-1efD;
	Wed, 29 Jul 2026 08:38:35 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozo7-00000007Fhp-3Lqn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 08:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1785314305; bh=mQusrFz3OyuSWO9NxPU1k1JP8a64bekTduq9i8UdhqI=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=kSyrsvfuzVPAK6yMZO0m5K31ueXpTo7gtNJxYlQylag4AfA5cOH950+70TbTrTzSw
	 nIZKttmaEXTZJYVowZJ1hekfUEdbYtSJzfUft3h9YwOtdLQpVg7ZCmmkEMfg51eO+Y
	 yuFSZ1XJpBJS185dcwb0Et+oY2GIlggLFI78KiLw=
Date: Wed, 29 Jul 2026 10:38:25 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: sunxi-ng: Change NKMP algorithm for finding factors
Message-ID: <5r4fxm7e2ooagq55nst2hblyeixrk7p3hijqra4sehzbfionvu@fwkwxhrjcfue>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260725122645.2270876-1-megi@xff.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725122645.2270876-1-megi@xff.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_013832_437237_3BC341F2 
X-CRM114-Status: GOOD (  33.05  )
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

On Sat, Jul 25, 2026 at 02:26:40PM +0200, megi xff wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> Current algorithm is very slow. It searches inefficiently in a brute
> force manner through all possibilities all the time.
> 
> Eg. it does >1500 iterations on every rate change twice, because
> ccu_nkmp_find_best() function is called multiple times per rate
> change.
> 
> New algorithm determines correct NKMP factors typically in 1 to 3
> iterations if precise factors can be determined for M = 1, P = 1,
> which is a typical case. If CPU clock frequency can't be derived
> precisely this drops to average 8 iterations needed to determine
> the factors.
> 
> The results are identical to the original algorithm, except in cases
> where the original algorithm does not try to satisfy SoC PLL clock
> constraints, like N*K range 10..88 or P factor being limited to output
> frequency < 240 MHz.
> 
> These restrictions are based on A64 SoC datasheet. Although they
> are sometimes not documented for other Allwinner SoC variants or are
> slightly different, this is still a significant improvement over
> not respecting any physical restrictions at all, as the previous
> algorithm did not. Hardcoding the values if fine, until someone
> finds some reason for not to.

I withdraw this patch. I reworked it with clock specific settings for these PLL
specific constraints (instead of hardcoding) and I'll run the new version for
a while before submitting again.

Best regards,
	o.

> 
> Motivation for this patch is that cpufreq schedutil scheduler thread
> manages to load one core to 70% all the time just doing these calculations
> while the core is running at just 24MHz during frequency changes.
> This helps improve the performance significantly.
>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> ---
> Sorry, I don't know how to avoid overlong lines here, other than
> maybe not indenting 3 toplevel for blocks and keeping all of them
> at the same level.
> 
>  drivers/clk/sunxi-ng/ccu_nkmp.c | 80 ++++++++++++++++++++++-----------
>  1 file changed, 55 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
> index 25efb5b37607..c39b19891431 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkmp.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
> @@ -32,40 +32,70 @@ static unsigned long ccu_nkmp_calc_rate(unsigned long parent,
>  static unsigned long ccu_nkmp_find_best(unsigned long parent, unsigned long rate,
>  					struct _ccu_nkmp *nkmp)
>  {
> +	unsigned long _k, _m, _p;
> +	unsigned long max_p = rate >= 240000000 ? 1 : nkmp->max_p;
> +	unsigned approx;
>  	unsigned long best_rate = 0;
> -	unsigned long best_n = 0, best_k = 0, best_m = 0, best_p = 0;
> -	unsigned long _n, _k, _m, _p;
>  
> -	for (_k = nkmp->min_k; _k <= nkmp->max_k; _k++) {
> -		for (_n = nkmp->min_n; _n <= nkmp->max_n; _n++) {
> +	for (approx = 0; approx <= 1; approx++) {
> +		for (_p = nkmp->min_p; _p <= max_p; _p <<= 1) {
>  			for (_m = nkmp->min_m; _m <= nkmp->max_m; _m++) {
> -				for (_p = nkmp->min_p; _p <= nkmp->max_p; _p <<= 1) {
> -					unsigned long tmp_rate;
> -
> -					tmp_rate = ccu_nkmp_calc_rate(parent,
> -								      _n, _k,
> -								      _m, _p);
> -
> -					if (tmp_rate > rate)
> -						continue;
> -
> -					if ((rate - tmp_rate) < (rate - best_rate)) {
> -						best_rate = tmp_rate;
> -						best_n = _n;
> -						best_k = _k;
> -						best_m = _m;
> -						best_p = _p;
> +				u64 nk = (u64)rate * _m * _p;
> +				unsigned long nk_rem = do_div(nk, parent);
> +
> +				if (nk_rem != 0 && !approx)
> +					continue;
> +
> +				if (nk < 10 || nk > 88)
> +					continue;
> +
> +				for (_k = nkmp->min_k; _k <= nkmp->max_k; _k++) {
> +					if (approx) {
> +						u64 _n = (u64)rate * _m * _p;
> +						unsigned long tmp_rate;
> +
> +						do_div(_n, parent * _k);
> +
> +						if (_n < nkmp->min_n || _n > nkmp->max_n)
> +							continue;
> +
> +						tmp_rate = ccu_nkmp_calc_rate(parent,
> +									      _n, _k,
> +									      _m, _p);
> +						if (tmp_rate > rate)
> +							continue;
> +
> +						if ((rate - tmp_rate) < (rate - best_rate)) {
> +							best_rate = tmp_rate;
> +							nkmp->n = _n;
> +							nkmp->k = _k;
> +							nkmp->m = _m;
> +							nkmp->p = _p;
> +						}
> +					} else {
> +						u64 _n = nk;
> +						unsigned long _n_rem = do_div(_n, _k);
> +
> +						if (_n < nkmp->min_n || _n > nkmp->max_n)
> +							continue;
> +
> +						if (_n_rem == 0) {
> +							nkmp->n = _n;
> +							nkmp->k = _k;
> +							nkmp->m = _m;
> +							nkmp->p = _p;
> +							return ccu_nkmp_calc_rate(parent,
> +										  nkmp->n,
> +										  nkmp->k,
> +										  nkmp->m,
> +										  nkmp->p);
> +						}
>  					}
>  				}
>  			}
>  		}
>  	}
>  
> -	nkmp->n = best_n;
> -	nkmp->k = best_k;
> -	nkmp->m = best_m;
> -	nkmp->p = best_p;
> -
>  	return best_rate;
>  }
>  
> -- 
> 2.54.0
> 

