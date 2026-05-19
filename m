Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0109FCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOkNWBAZkGKo7viWU2Qk1mWVMlFpqvUUKWuw5O+LCN0=; b=pbI5i1vayQAIcqXd5bsXkjwDyM
	ZvJYk+8EvaRsJ8hhBhTrxe+ZPXYECViKg1iLqwyWVXttkLTl27NtSW/y/NlOPJ572jj2na5dPT5Kg
	F3LUuN+DtAMlMhopazaovbYmSxtxDqkqvAlnuuSBnLHSdUG5xT9b0hj+OFwuLl55eub2fvgY9QcCY
	hG2BzicUQhjJQKqLjKvKKrfmMSvV8FI4Kpn0GU4KcbL/se5pYtY8QJeGM8sQw0aQCIpQraSTsQf/h
	f51vN5p55Rc5lfzvQN0AailIq+VVew0CGqROc4QjpMi80wnq3PsJXdkAEDqLB98r7JyRFiSib97mT
	0zC8aWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPK7N-00000001ZyX-0P6B;
	Tue, 19 May 2026 13:04:17 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPK7J-00000001ZxZ-3ZtM;
	Tue, 19 May 2026 13:04:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779195844; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GB+WerbFMRkWy3I183W9x9oxiqbtOkF8YJSBGgsP7LVhBU/CAYTLaZME51m8NWLT1+Gol882JysK/jrexMuBRRYzQZoY/oKBo8pVaFnLnIT/QhRxF41zsX3Wr2PmwND+pYkGm6+VsK8t3fbiEAlbHs23QRLEVdD45D62tkDPZ5o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779195844; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lOkNWBAZkGKo7viWU2Qk1mWVMlFpqvUUKWuw5O+LCN0=; 
	b=kIFtLlvHQCnXwq35vCcWiQCZe+QeVCCX+Ji49rDqo+zUgDwad3rIyQhS34qBhcHuLXwgYtdkBVhR8hAuf4p48xi2s8fxIPubXYtY8UFMfoDR9Um+Efk0sroQyEqTawOiwuKeeGcHzrdz7xwlNMFmpS/uRdZHDSijpR5wrRppmH4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779195844;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lOkNWBAZkGKo7viWU2Qk1mWVMlFpqvUUKWuw5O+LCN0=;
	b=cbR5tVSX8wMXtX/ZasIAJ/lGo/nm6CUO9dbwNfZLPZh9lmk/uPHwnOXI8PjX5DPk
	oMBfggbZ9Fkz8YeDPSla1OYUaXePJ5VxUDjpiK8BjJqpviXj5cKebsaZAb24OVrfGOG
	RDRXzvLRZAftuJ8AUfNOH44iQH+fqsLdNMAnHbQU=
Received: by mx.zohomail.com with SMTPS id 1779195842519140.95091862880702;
	Tue, 19 May 2026 06:04:02 -0700 (PDT)
Message-ID: <67bd72ba-6dab-4bdb-a391-27545e287e94@collabora.com>
Date: Tue, 19 May 2026 09:04:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rkvdec: hevc: cap EXT SPS RPS control counts
 before descriptor assembly
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260513181922.2075438-1-michael.bommarito@gmail.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <20260513181922.2075438-1-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_060413_958223_061AB593 
X-CRM114-Status: GOOD (  37.05  )
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

Hi Michael,

On 5/13/26 14:19, Michael Bommarito wrote:
> V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS and
> V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS are registered as dynamic-size
> controls with a per-control element cap of 65. The V4L2 control core
> enforces only the payload-element cap. It does not bound the spec-derived
> count fields that the rkvdec HEVC helper later uses to walk fixed hardware
> descriptor tables and temporary helper arrays:
>
>    - struct rkvdec_rps::refs[32]
>    - struct rkvdec_rps::short_term_ref_sets[64]
>    - struct calculated_rps_st_set::delta_poc_s0[16] / delta_poc_s1[16]
Still, did you try just changing the cap to 64 (.cfg.dims = { 64 },) ?
You'd need a test that sets the control from userspace though.

It should refuse setting the control if there are more than 64 elements, 
therefore the hevc decoder will not run any function using the count 
values from the SPS (See  rkvdec-vdpu381-hevc.c:601)
> A userspace V4L2 client that can open the Rockchip RKVDEC m2m decoder node
> may submit SPS/RPS controls whose counts exceed those capacities or whose
> prediction reference index underflows. rkvdec_hevc_assemble_hw_rps() then
> walks past the descriptor table or temporary-array bounds.
>
> KASAN under a small KUnit harness wrapping the real helper reports
> slab-out-of-bounds in all of:
>
>    - num_short_term_ref_pic_sets = 65 (write past short_term_ref_sets[64])
>    - num_long_term_ref_pics_sps = 33  (write past refs[32], intra-struct)
>    - ext_sps_st_rps[i].num_negative_pics or num_positive_pics > 16
>      (write past delta_poc_s0[16] inside calculated_rps_st_set)
>    - INTER_REF_PIC_SET_PRED with delta_idx_minus1 + 1 > i
>      (u8 ref_rps_idx underflow then OOB read on calculated_rps_st_sets)
>
> Validate the SPS/RPS counts before calling the assembly helpers. The cap
> values match both the HEVC spec ranges (num_short_term_ref_pic_sets <= 64,
> num_long_term_ref_pics_sps <= 32) and the fixed driver descriptor and
> helper-array capacities. Reject controls whose counts exceed those, and
> reject prediction entries whose reference index would underflow.
>
> Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> Assisted-by: Claude:claude-opus-4-7
> ---
>
> I don't have a RK3588 / RK3576 board to confirm this through a real
> /dev/videoN request path yet, but was convinced enough by:
>
>    1. Static reach: registration of EXT_SPS_ST_RPS / EXT_SPS_LT_RPS with
>       .dims = { 65 } at drivers/media/platform/rockchip/rkvdec/rkvdec.c
>       :239-287, the SPS-count-driven loops in rkvdec-hevc-common.c
>       :213-225 and :228-251, and v4l2-ctrls-core.c :1213-1277, which
>       validates only EXT RPS flags and not the spec-derived count fields.
>
>    2. A KUnit harness (separate, not in this patch) that allocates one
>       struct rkvdec_rps + a single calculated_rps_st_sets element via
>       kunit_kzalloc / kzalloc and calls the real
>       rkvdec_hevc_assemble_hw_rps() helper. Under UML + KASAN_GENERIC with
>       the kasan_multi_shot boot param, on a stock tree it produces these
>       reports:
>
>         BUG: KASAN: slab-out-of-bounds in
>           rkvdec_hevc_assemble_hw_rps+0xb0c/0x1080
>           (num_short_term_ref_pic_sets = 65, write of size 36 0 bytes past
>           the rps allocation)
>
>         BUG: KASAN: slab-out-of-bounds in
>           rkvdec_hevc_assemble_hw_rps (num_negative_pics = 64, write past
>           the single-element kzalloc'd calculated_rps_st_sets buffer)
>
>         BUG: KASAN: slab-use-after-free / slab-out-of-bounds reads via
>           u8 ref_rps_idx underflow at calculated_rps_st_sets[255]
>           (INTER_REF_PIC_SET_PRED with delta_idx_minus1 = 0, idx = 0)
>
>       The num_long_term_ref_pics_sps = 33 case is invisible to KASAN
>       (the OOB write lands inside struct rkvdec_rps) but corrupts
>       short_term_ref_sets[0]; the harness asserts that case explicitly.
>
>    3. Same harness on the patched tree: all five cases (four adversarial
>       plus a legitimate-limit regression with ST=64, LT=32, num_neg=1)
>       pass clean, no KASAN reports.
>
> If hardware-side validation actually does reject these counts before
> rkvdec_hevc_assemble_hw_rps() runs and this patch is unnecessary, please
> say so and I will withdraw it. If it is reachable, I will follow up with
> a runtime hardware splat once the Orange Pi board I bought arrives.
>
> Let me know if you want a patch set with the KUnit harnesses too.
>
> checkpatch.pl: 0 errors / 0 warnings.
>
>   .../rockchip/rkvdec/rkvdec-hevc-common.c      | 49 +++++++++++++++++++
>   1 file changed, 49 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> index 3119f3bc9f98..895fb16bc572 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> @@ -408,9 +408,58 @@ static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rk
>   	memcpy(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps));
>   }
>   
> +/*
> + * V4L2 caps the EXT_SPS RPS payload length but not the SPS-derived counts
> + * that the helpers walk. Caps match the HEVC spec ranges.
> + */
> +#define RKVDEC_HEVC_MAX_SHORT_TERM_REF_PIC_SETS	64
> +#define RKVDEC_HEVC_MAX_LONG_TERM_REF_PICS_SPS	32
> +#define RKVDEC_HEVC_MAX_RPS_NEG_POS_PICS	16
> +
> +static int rkvdec_hevc_validate_rps_ctrls(struct rkvdec_hevc_run *run)
> +{
> +	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
> +
> +	if (run->ext_sps_lt_rps &&
> +	    sps->num_long_term_ref_pics_sps >
> +	    RKVDEC_HEVC_MAX_LONG_TERM_REF_PICS_SPS)
> +		return -EINVAL;
> +
> +	if (run->ext_sps_st_rps) {
> +		unsigned int i;
> +
> +		if (sps->num_short_term_ref_pic_sets >
> +		    RKVDEC_HEVC_MAX_SHORT_TERM_REF_PIC_SETS)
> +			return -EINVAL;
> +
> +		for (i = 0; i < sps->num_short_term_ref_pic_sets; i++) {
> +			const struct v4l2_ctrl_hevc_ext_sps_st_rps *r =
> +				&run->ext_sps_st_rps[i];
> +
> +			if (r->num_negative_pics >
> +			    RKVDEC_HEVC_MAX_RPS_NEG_POS_PICS ||
> +			    r->num_positive_pics >
> +			    RKVDEC_HEVC_MAX_RPS_NEG_POS_PICS)
> +				return -EINVAL;
> +
> +			if ((r->flags &
> +			     V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED) &&
> +			    (unsigned int)r->delta_idx_minus1 + 1 > i)
> +				return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
>   				 struct v4l2_ctrl_hevc_ext_sps_st_rps *st_cache)
>   {
> +	if (rkvdec_hevc_validate_rps_ctrls(run)) {
> +		pr_err_ratelimited("rkvdec: rejecting HEVC SPS/RPS controls with out-of-range counts\n");
> +		return;
> +	}
> +
>   	rkvdec_hevc_prepare_hw_st_rps(run, rps, st_cache);
>   	rkvdec_hevc_assemble_hw_lt_rps(run, rps);
>   }


