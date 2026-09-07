Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD05C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slBfEXfmlFqojlsYQ0rgM6V/6N10xUVb/4TTHC5BcLU=; b=D3K/sYAWVx/YVyA9y+YZCl84VD
	/jUniQ0B9cun8aT3Rn9eHkwAX+lNJK5q7W45nfQw+3aaWctpHK2IAQ5FI5M3pUgmL5I5d8a9Er3yc
	1vx8PpqpXFqfyo/vFpf0ZPez+5MCD2Mk404crdol2dFzJByiStUYJMha+IeLKaFG3A23rtMyu7pOy
	PeiZz+CqSV/Iuega2tJUuKFrWWIUfT/o6Dy9/3YlDr/NvDlSskG0sfFXnBAIAx5ClWuYgE+3Ebkf5
	HXWREtPe4n6pk9AImeI6EfQGmbBVeafztPvccJNvTN89gwnw+4/lBaBiYPlnvnYyv5YUTgBT297Qu
	lMtgXsEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZYb-00000006xjy-2oKk;
	Mon, 07 Sep 2026 13:38:45 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZYZ-00000006xjC-1uRa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Cc: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1788788322;
 bh=slBfEXfmlFqojlsYQ0rgM6V/6N10xUVb/4TTHC5BcLU=;
 b=uGvG4It5Gwa3VlZeK0LqVNgCMNxtyVqzUDswPOq5IeaZR0CxWItM3LxBcIqREkWb7PTVCBWWC
 txV1eblA6gJZGxwsuffXUQ7jOV0DYWjj4chKcQ89XnaEL1QFwlzrSSaoVBYCrOjAy5cQ4NvulME
 kXaQgBs0FQUvbSWXbcA2IKW2bMF/C2SgR0V8VtciDDEili8aKTR6YN+IBrMVxn435VC9wn7HCsO
 9yZveK7RpBCgRa2gUEy0kdV6zmC9vTlqBSvA9gT/2A3ki4dkuT7WCJoe7axuyCiUpPI8YMoJ/4D
 hRKkqN93P8RznlKehkm6jgl5pJzk0MHffLu95WcshIMg==
X-Forward-Email-ID: 6a9ebe5670f4b45aa0d06668
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 07 Sep 2026 09:38:28 -0400
Message-Id: <DL94J88RKZ3S.2EX69YJ6JOX4P@ubuntu.com>
Subject: Re: [PATCH v2 11/22] thunderbolt: Find Apple VSE capability during
 startup
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Andreas
 Noever" <andreas.noever@gmail.com>, "Mika Westerberg" <westeri@kernel.org>,
 "Yehezkel Bernat" <YehezkelShB@gmail.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-11-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-11-1f80085f93fb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_063843_879518_3907F5D8 
X-CRM114-Status: GOOD (  14.33  )
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

On Sun Sep 6, 2026 at 2:36 PM EDT, Sven Peter wrote:
> Only Apple Silicon host routers have the Apple vendor-specific extended
> capability. Look it up when the software connection manager starts and
> store its offset in the root switch.
>
> The Apple NHI driver can then use the stored offset when programming
> cable information without searching the router capabilities itself.
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/tb.c      | 4 ++++
>  drivers/thunderbolt/tb.h      | 2 ++
>  drivers/thunderbolt/tb_regs.h | 1 +
>  3 files changed, 7 insertions(+)
>
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index bf1c192ec10a..d2832323cc36 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3025,6 +3025,10 @@ static int tb_start(struct tb *tb, bool reset)
>  		return dev_err_probe(tb->nhi->dev, PTR_ERR(tb->root_switch),
>  				     "failed to allocate host router\n");
> =20
> +	ret =3D tb_switch_find_vse_cap(tb->root_switch, TB_VSE_CAP_APPLE);
> +	if (ret > 0)
> +		tb->root_switch->cap_vsec_apple =3D ret;
> +

Nitpick: I *think* based on the surrounding code that this can be
simplified to "if (ret)"

-Josh

