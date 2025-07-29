Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43D7C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbYaN4ncaC0fEvQ/Bbn3DQ53qZe1pK4nSqgAe9aIAe0=; b=x3f57T5XpBs3MyMqHepGkmRKFG
	SfctdH0IGgoRzfXr4FK5mYNNZH5P4ecxT8rli23rVu8Wn+sEFNfqRctoi08zU8WBxt6idLG7jaGs7
	RkG9SgV7YJFncU4gdLnL3C2HbHZalbpPJu9zuCFeBOlpDe/d5e3izlqvLLTvAQnWTnre0FQ8iB6Pw
	kpQIGxMskIkvO2Sj4KiHQkasI4FKxnh0Ji9ZhlAL4L/kKlAiBku8l4/AT9sPQNxS83j8MS0HFhTuU
	DwuxmFSlJp9BpDnwzbXJ/QStWDLgZx+LqO3a80Klm02q2CGNSHtb7HeI8lksDvec/4POLM+NJFNjN
	PD92AskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnsL-0000000HL7I-3nnF;
	Tue, 29 Jul 2025 17:12:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugneb-0000000HJqt-1hmd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 16:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C90560202;
	Tue, 29 Jul 2025 16:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A35EC4CEF5;
	Tue, 29 Jul 2025 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753808296;
	bh=Hb9smdHf0g56CpF8sBWDOF38RasuaUJ0puvOlmqvOjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlPT85UP6HQLETFTi6OtUJx9aRuyZBcfrc4BG0gLSetfvPPGD3huNlBLFo0yL5k22
	 Mtx9Bqa1YmgYyOQeni00rZcMrLD1xMmj+A/AcO7/p2AZGoUM57od4OFqJgUlcbZPy1
	 vwoHTTPkVS1J/e0Wea9moLyTMgW5hPt3gOmatUFpd7vYVdHguB+8uTPSslkTw2M+Nd
	 AQ9lmMqb8djPioT5MzVN22+r099MIJTq6z508uKiDs1wcvKL++f6Yh4T1g5d9/PNTn
	 kMtkM/iz68Sx+YMXAHzvOowhlMKSqVIczcTgLwLbXL7BKChTSMwB2V7Xl1e7J3sn/D
	 v2qe7PZzt4j6A==
Date: Tue, 29 Jul 2025 17:58:10 +0100
From: Simon Horman <horms@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] drivers: net: stmmac: handle start time
 set in the past for flexible PPS
Message-ID: <20250729165810.GG1877762@horms.kernel.org>
References: <20250729-relative_flex_pps-v2-0-3e5f03525c45@foss.st.com>
 <20250729-relative_flex_pps-v2-1-3e5f03525c45@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-relative_flex_pps-v2-1-3e5f03525c45@foss.st.com>
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

On Tue, Jul 29, 2025 at 04:52:00PM +0200, Gatien Chevallier wrote:
> In case the time arguments used for flexible PPS signal generation are in
> the past, consider the arguments to be a time offset relative to the MAC
> system time.
> 
> This way, past time use case is handled and it avoids the tedious work
> of passing an absolute time value for the flexible PPS signal generation
> while not breaking existing scripts that may rely on this behavior.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 31 ++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> index 3767ba495e78d210b0529ee1754e5331f2dd0a47..5c712b33851081b5ae1dbf2a0988919ae647a9e2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -10,6 +10,8 @@
>  #include "stmmac.h"
>  #include "stmmac_ptp.h"
>  
> +#define PTP_SAFE_TIME_OFFSET_NS	500000
> +
>  /**
>   * stmmac_adjust_freq
>   *
> @@ -172,6 +174,10 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
>  
>  	switch (rq->type) {
>  	case PTP_CLK_REQ_PEROUT:
> +		struct timespec64 curr_time;
> +		u64 target_ns = 0;
> +		u64 ns = 0;
> +

I think you need to wrap this case in {}, as is already done for the following
case.

Clang 20.1.8 W=1 build warn about the current arrangement as follows.

  .../stmmac_ptp.c:177:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    177 |                 struct timespec64 curr_time;
        |                 ^
  1 warning generated.

GCC 8.5.0 (but not 15.1.0) also flags this problem.

Also, please note:

## Form letter - net-next-closed

The merge window for v6.17 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after 11th August.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

-- 
pw-bot: defer

