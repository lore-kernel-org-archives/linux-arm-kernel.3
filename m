Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E31CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 14:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfc8FzML2xMwBf4Ai9cgabfA7aHhY97W7m3ggQXn0qM=; b=feAsImDcWqkH/LJVvnsm82ATI4
	OcxrHHldfqCEkWUnZxNzJn54B1H4yxJn9ltk8ujAcGS/f1spJUne4fDpFQIieV4E95s4JD4sEej8Y
	vS2x/5PtSl11oe8VO8scDEM9uS2oxi7/f8R/Y0xeUq7qLDhUaJ4UDwM6TXkbJ5Tt16jwo7TYW804H
	wLMgA0nviHy68jcjT0SzB47DHKskIx9Ex6Bmziam3Xa4JeJrge6idjykuomWxn2ce/jP8UgeMSNMT
	7ckYpsonGUK71gwJEUr4zrhEuqKLtOrozGheOjgaQ17EgA2GJ5wtudCb3LlF14fbNSWKrnrzGDaNZ
	SCuBcXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bYJ-00000005Wzt-2R3g;
	Tue, 30 Sep 2025 14:42:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bYG-00000005WzM-2EqV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 14:42:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F4041424;
	Tue, 30 Sep 2025 07:41:48 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C65113F66E;
	Tue, 30 Sep 2025 07:41:55 -0700 (PDT)
Date: Tue, 30 Sep 2025 15:41:53 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/6] coresight: Repack struct etmv4_drvdata
Message-ID: <20250930144153.GI7985@e132581.arm.com>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
 <20250814-james-cs-syncfreq-v2-3-c76fcb87696d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-james-cs-syncfreq-v2-3-c76fcb87696d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_074200_693176_EE463778 
X-CRM114-Status: GOOD (  15.53  )
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

On Thu, Aug 14, 2025 at 11:49:54AM +0100, James Clark wrote:
> Fix holes and convert the long list of bools to single bits to save
> some space because there's one of these for each ETM.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x.h | 39 ++++++++++++++-------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index a355a1e9606d..1c67b263b01b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -1020,29 +1020,30 @@ struct etmv4_drvdata {
>  	u8				ns_ex_level;
>  	u8				q_support;
>  	u8				os_lock_model;
> -	bool				sticky_enable;
> -	bool				boot_enable;
> -	bool				os_unlock;
> -	bool				instrp0;
> -	bool				q_filt;
> -	bool				trcbb;
> -	bool				trccond;
> -	bool				retstack;
> -	bool				trccci;
> -	bool				trc_error;
> -	bool				syncpr;
> -	bool				stallctl;
> -	bool				sysstall;
> -	bool				nooverflow;
> -	bool				atbtrig;
> -	bool				lpoverride;
> +	bool				sticky_enable : 1;
> +	bool				boot_enable : 1;
> +	bool				os_unlock : 1;
> +	bool				instrp0 : 1;
> +	bool				q_filt : 1;
> +	bool				trcbb : 1;
> +	bool				trccond : 1;
> +	bool				retstack : 1;
> +	bool				trccci : 1;
> +	bool				trc_error : 1;
> +	bool				syncpr : 1;
> +	bool				stallctl : 1;
> +	bool				sysstall : 1;
> +	bool				nooverflow : 1;
> +	bool				atbtrig : 1;
> +	bool				lpoverride : 1;
> +	bool				state_needs_restore : 1;
> +	bool				skip_power_up : 1;
> +	bool				paused : 1;

I used pahole to check the structure layout. It is good to see that
bool fields are packed into single cache line (and we don't expect
these fields to modified frequently so no concern for false sharing).

  /* XXX 1 byte hole, try to pack */

  u16                        ccitmin;              /*   120     2 */
  u8                         s_ex_level;           /*   122     1 */
  u8                         ns_ex_level;          /*   123     1 */
  u8                         q_support;            /*   124     1 */
  u8                         os_lock_model;        /*   125     1 */
  bool                       sticky_enable:1;      /*   126: 0  1 */
  bool                       boot_enable:1;        /*   126: 1  1 */
  bool                       os_unlock:1;          /*   126: 2  1 */
  bool                       instrp0:1;            /*   126: 3  1 */
  bool                       q_filt:1;             /*   126: 4  1 */
  bool                       trcbb:1;              /*   126: 5  1 */
  bool                       trccond:1;            /*   126: 6  1 */
  bool                       retstack:1;           /*   126: 7  1 */
  bool                       trccci:1;             /*   127: 0  1 */
  bool                       trc_error:1;          /*   127: 1  1 */
  bool                       syncpr:1;             /*   127: 2  1 */
  bool                       stallctl:1;           /*   127: 3  1 */
  bool                       sysstall:1;           /*   127: 4  1 */
  bool                       nooverflow:1;         /*   127: 5  1 */
  bool                       atbtrig:1;            /*   127: 6  1 */
  bool                       lpoverride:1;         /*   127: 7  1 */
  /* --- cacheline 2 boundary (128 bytes) --- */
  bool                       state_needs_restore:1; /*   128: 0  1 */
  bool                       skip_power_up:1;      /*   128: 1  1 */
  bool                       paused:1;             /*   128: 2  1 */

Reviewed-by: Leo Yan <leo.yan@arm.com>

>  	u64				trfcr;
>  	struct etmv4_config		config;
>  	u64				save_trfcr;
>  	struct etmv4_save_state		*save_state;
> -	bool				state_needs_restore;
> -	bool				skip_power_up;
> -	bool				paused;
> +
>  	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
>  };
>  
> 
> -- 
> 2.34.1
> 

