Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28D3C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCH2ArP3YXCqY+N5LvM1AvwEMdALrEinYage/fEFyGQ=; b=Scb4XpyjEstCDSBcTW/Ur4PXc9
	n0gDWA1Ig1ltXlXmq5r7+2CPCTAqnuOfBngcYDrB2v0MoVBmligrb7Bwb+alqIwytFiurx5Q6oy2V
	wC/ygFcQx2JalLiOW58QzGkXJ2s5tAG+wq7sgwpWDZodaFRqwK8bkykGGB4ZpGEMo5mFA2lLFoUae
	smQmLL+mIV3bYStL6Zj5gzBw6dMk9j+DkDSen6Vcx1Mpxz6P8bRUvrrhVj2hfwzMiwjx5cS+YfwPG
	5NPha3z2PdHnGiNMebLLv04PCg6Oqn4zRNxLPZBiT6JyPOTISqrV+2/C7VHcHpqrjALNJ9SiPxaNB
	ckpq/jnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraON-00000003rru-18OO;
	Wed, 05 Aug 2026 12:06:39 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraOK-00000003rrW-2vCi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:06:37 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 583CD1D000F9;
	Wed,  5 Aug 2026 08:06:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 05 Aug 2026 08:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785931595; x=1786017995; bh=uCH2ArP3YX
	CqY+N5LvM1AvwEMdALrEinYage/fEFyGQ=; b=KI8LcDABuTJduK0RO5dyxTf6aD
	kBEPCFejn1NYPHmzzSloX71C/cHfFdqVbzAPAesgIAcrwNjHTr9upvmr+YKKlL1x
	EctIxdOh3YwuoF+sNw40q1/5+au/5qPvBx4i/upwYDR5+/jQhrHZ0UWKj5e4Fslv
	4WIOtJRmox8gW1J9pUv4yEBYCMV5dOnQOuB6Cxt2mnNoZJZ7Pyn6sB8JYBNAt53h
	Orko06VpBPWaB1NL8U48QbrJvMof9ZhAWLS99Qq92bTL3xFsg2R9Uu9v73rYO0DY
	pQ9OEAxcwWNgllojx5PNiH60flW9uLzQo5LvOk0oht7wzSu3yQsoNyZjSqOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785931595; x=1786017995; bh=uCH2ArP3YXCqY+N5LvM1AvwEMdALrEinYag
	e/fEFyGQ=; b=Z2v3cyomB1PB4GwnGrAkJWCbhc68LKW7r/oA5W29UU32+6b7YIA
	ngBThDz3uxMDtlzs+VpG0flrp8Bw8V/HxptwkFiSDdMRKav0nnoxGVO/4kJ/wXqH
	RysOQdQHAkxlhbJGiWiUz+SXsYE3As53q21uH7VBrsE5YF0gQDxLq/6lsd2gG4vW
	6KCuSYirg4IWNmpMTYu0wXaoA68VoNdS6Nf5vBgPp/6C74CNksQs2o83sFTJmQP6
	nMQrxtDPda8RcTpPXpCfGsg0enm2eKQRDKnffruzHMLORaD5wbXVbuhJ//vgMkM/
	oGbFlr9l9WJ0UEm/lr7t61tALg21Dt8c4Lw==
X-ME-Sender: <xms:SidzaswSIv2VvT-985Y9sxXOSxmlKr5RhX_g03WYjA72QPYl2qybHA>
    <xme:SidzamrH3_LYQlydWwlMuVpQ3oI6txOt5J64HIKctqTjGqfixGf5GPDgjYHdFCFdq
    umlUIHR7ZINZcOZKsTn7KbKJEZP4b_CqlGWxjIhZRKT388dAZxah_dg>
X-ME-Received: <xmr:SidzaqlFGbWp7WRyEYoEpzX9QK-RKdk0k1ln7734yv8W8AZzmzi4HYCU7Fm_pzfn-wnUfL8aWWFadCoxh_ldSwI2hMAnhET-gMs>
X-ME-Proxy-Cause: dmFkZTGg4gHFWX/1EjYXAxtIRZWZMG+Rj5WZxw6FK+u6PHVpV5bLsk6WQMPSuqoH6nqEr/
    l4GMAkNMH1YcDmK5IqbD6/qVUN9jNEwiNF+eS3cKa6x/UnKd8gcwwlTg+Ri1XRQYJtz1AR
    Zio5g3bvOJI3zxIodiB1sFgDeMIEWjj7rSvfjbglmH0MVH2OohTXEU7VtLrsEs3k0GML0F
    rzhFmOljDAfhtwuBEASommCqh3EH4o5VQRFhshTFE7MnC+RzAVpyEMYp5kEHAQDkTA7Fkl
    hTYspyTvAUPxqAQDCAQR/5nbRCgT7TsBRjPzHQShiXvxJ/QmS3iZHUKgr6SGmwLjnQxnGE
    NJym7JX+z2dlTZ8rL6gENZHpX7sDOa76sqWLCzvleNMTiD1JxXptda3YUnHgRPjCbeB95j
    ApQi68xY1DE4CBw6DY+HQJiparia/RbiA2PNV0A2ukaf4v9BP/06ew2bnHTvfXzFVJvk6j
    PkV66c6X086BeulwWT9EyfWASNXxVKZfzOppgUKMohH4wPCEF4XW2HyQozBMBJgJszB/xt
    owZe14krcNs/Q73FJJbPXnEW0PbqZz/dF3+5A1f3EJU6q/GZPSLo9C5IYl1IKwj2Ub6N03
    cO7pyDQAVYGeERKmPPUYmApEujslzmRS4TVBXhHffrM8ixn8p0RKnbwPW7dg
X-ME-Proxy: <xmx:SidzaoUekvsWmXQmuWx8M77mvB4-KnA1Z4Sw5EK-2jEcVz-HoNG0gA>
    <xmx:SidzamqHKHZUghg_DGnkSYgZP1_x3QP-khEoj_1cvNRN0LeU_Zfi0g>
    <xmx:SidzahUwTYjRpIqN0u455ZjUQ8Uo5v0bmULaNGC51cxJn2Tu83ZxTQ>
    <xmx:SidzavE5WmU_WCt9vahlOxutBqFYtg740ZZfCAh_Vk3H_Tv8o0Txig>
    <xmx:SydzagVmct1DPYCWX9frL6FZSvhtmZP8fimoxvgVHNefJYmBeYxYrv8y>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 08:06:34 -0400 (EDT)
Date: Wed, 5 Aug 2026 14:06:33 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alba Mendez <me@alba.sh>
Subject: Re: [PATCH v4 3/6] spmi: apple: check transaction status
Message-ID: <20260805120633.GC832571@robin.jannau.net>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-3-c15a12d9a7d1@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-t603x-spmi-v4-3-c15a12d9a7d1@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_050636_779650_36D059B5 
X-CRM114-Status: GOOD (  20.18  )
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

On Wed, Aug 05, 2026 at 12:11:13PM +0200, Sasha Finkelstein wrote:
> From: Alba Mendez <me@alba.sh>
> 
> Check for parity errors and missing command ACKs
> 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index 4d5356bf9bbf..7ebf899edf17 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -11,6 +11,8 @@
>   *		spmi-pmic-arb.c Copyright (c) 2021, The Linux Foundation.
>   */
>  
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> @@ -23,6 +25,12 @@
>  #define SPMI_RSP_REG 0x8
>  #define SPMI_ACT_REG 0xa4
>  
> +/* SPMI_RSP_REG reply word */
> +#define SPMI_REPLY_FRAME_PARITY_STATUS GENMASK(31, 16)
> +#define SPMI_REPLY_ACK BIT(15)
> +#define SPMI_REPLY_SLAVE_ID GENMASK(14, 8)
> +#define SPMI_REPLY_CMD GENMASK(7, 0)
> +
>  #define SPMI_ACT_FIFO_FLUSH BIT(0)
>  #define SPMI_RX_FIFO_EMPTY BIT(24)
>  
> @@ -66,7 +74,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  {
>  	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
>  	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
> -	u32 rsp;
> +	u32 reply, rsp;
>  	size_t len_read = 0;
>  	u8 i;
>  	int ret;
> @@ -82,12 +90,12 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	if (ret)
>  		return ret;
>  
> -	/* Discard SPMI reply status */
> -	readl(spmi->regs + SPMI_RSP_REG);
> +	reply = readl(spmi->regs + SPMI_RSP_REG);
>  
>  	/* Read SPMI data reply */
>  	while (len_read < len) {
>  		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
> +			spmi->prev_fail = true;

should this have been in the previous patch? Not sure if the flush helps
in this case but the line looks in this change out-of-place

>  			dev_err_ratelimited(&ctrl->dev,
>  					    "FIFO lacks reply data, controller stuck?\n");
>  			return -EIO;
> @@ -105,6 +113,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  		spmi->prev_fail = true;
>  	}
>  
> +	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << len) - 1)) {
> +		dev_err(&ctrl->dev, "some frames failed parity check\n");
> +		return -EIO;
> +	}
>  	return 0;
>  }
>  
> @@ -113,6 +125,7 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  {
>  	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
>  	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
> +	u32 reply;
>  	size_t i = 0, j;
>  	int ret;
>  
> @@ -136,14 +149,17 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	if (ret)
>  		return ret;
>  
> -	/* Discard */
> -	readl(spmi->regs + SPMI_RSP_REG);
> +	reply = readl(spmi->regs + SPMI_RSP_REG);
>  
>  	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
>  		dev_warn(&ctrl->dev, "FIFO has extra data\n");
>  		spmi->prev_fail = true;
>  	}
>  
> +	if (!FIELD_GET(SPMI_REPLY_ACK, reply)) {
> +		dev_err(&ctrl->dev, "command not acknowledged\n");
> +		return -EIO;
> +	}
>  	return 0;
>  }

besides the single misplaced line

Reviewed-by: Janne Grunau <j@jannau.net>

Janne

