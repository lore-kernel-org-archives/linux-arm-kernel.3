Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B3410A88E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoLalS3RlG932bhgLxdv/NYV9f4qIr4106kzeCrJ97Q=; b=Bg4wBJ6HlHmzg+aa5vPb4CANxH
	csXmQEtOhlDuJbJRtgp3cGuXrvUfG5d5O5wNTM9dzcq7goruMtXsJMYhHlhXocW5E7DjC33GZzto0
	efNuBnhtqyDRkbdNMaOjf1BvBasawkSebI7wYBQeuozP+3LmeslyEC3reXJqP25vMpYk03vPfIcAO
	Ul5vFRLJq1g5Oy68cu/NehfQYa0CakpFqRuG+a63SMclvb/lC0OuJFHg+LA7K/QM43SI5zxPAIv6r
	r145Y98SCPQmSFq/nsoVbrrY2FIy+i680HgHN/Q9f+wohNHSMsULEnKONv+FMi1ZRjqRaI80nCOHj
	lncRiFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mlm-00000005mQ7-33BY;
	Thu, 26 Mar 2026 15:37:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkQ-00000005lF5-3Jlj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8B881D6F;
	Thu, 26 Mar 2026 08:35:42 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B32803F99C;
	Thu, 26 Mar 2026 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774539348; bh=YVG0FlxMDpsJGDv7zlW5c/pCwoam9J4eKlhKt9Gme2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JxnZgFS6/t1fXTv5sC4XPGBHFE3vYzAx0W95PUg+xQv0C4b8U4xRYPY+nF+T9GMgI
	 3X9/FD2gPDF/fAfYsJLj0W/4B8e1fW7oBXrMuDzoCGHGMp3Qthr76Hg2hRS8oZ2dw1
	 YW11Fycd/oP6SPx+WqS1C/F24RjEKvsEs1QjdTzA=
Date: Thu, 26 Mar 2026 15:35:42 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Elif Topuz <elif.topuz@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, d-gole@ti.com,
	jonathan.cameron@huawei.com, lukasz.luba@arm.com,
	philip.radford@arm.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH v2 07/17] firmware: arm_scmi: Use new Telemetry traces
Message-ID: <acVSTu5oqeZ6jA9f@pluto>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
 <20260114114638.2290765-8-cristian.marussi@arm.com>
 <3c6bddfd-a674-486c-add4-35ef93ec88c4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c6bddfd-a674-486c-add4-35ef93ec88c4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083550_982314_46C66218 
X-CRM114-Status: GOOD (  26.45  )
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

On Fri, Jan 23, 2026 at 11:43:37AM +0000, Elif Topuz wrote:
> 
> Hi Cristian,

Hi Elif,

> 
> On 14/01/2026 11:46, Cristian Marussi wrote:
> > Track failed SHMTI accesses and received notifications.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> >  drivers/firmware/arm_scmi/telemetry.c | 57 ++++++++++++++++++++++-----
> >  1 file changed, 48 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> > index 16bcdcdc1dc3..443e032a3553 100644
> > --- a/drivers/firmware/arm_scmi/telemetry.c
> > +++ b/drivers/firmware/arm_scmi/telemetry.c
> > @@ -25,6 +25,8 @@
> >  #include "protocols.h"
> >  #include "notify.h"
> >  
> > +#include <trace/events/scmi.h>
> > +
> >  /* Updated only after ALL the mandatory features for that version are merged */
> >  #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
> >  
> > @@ -1366,8 +1368,10 @@ static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
> >  
> >  	/* Check for spec compliance */
> >  	if (USE_LINE_TS(payld) || USE_BLK_TS(payld) ||
> > -	    DATA_INVALID(payld) || (PAYLD_ID(payld) != 0))
> > +	    DATA_INVALID(payld) || (PAYLD_ID(payld) != 0)) {
> > +		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, 0);
> >  		return;
> > +	}
> >  
> >  	/* A BLK_TS descriptor MUST be returned: it is found or it is crated */
> >  	bts = scmi_telemetry_blkts_lookup(ti->ph->dev, &ti->xa_bts, payld);
> > @@ -1376,6 +1380,9 @@ static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
> >  
> >  	/* Update the descriptor with the lastest TS*/
> >  	scmi_telemetry_blkts_update(shmti->last_magic, bts);
> > +
> > +	trace_scmi_tlm_collect(bts->last_ts, (u64)payld,
> > +			       bts->last_magic, "SHMTI_BLK_TS");
> >  }
> >  
> >  static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
> > @@ -1393,8 +1400,10 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
> >  	/* Is thi DE ID know ? */
> >  	tde = scmi_telemetry_tde_lookup(ti, de_id);
> >  	if (!tde) {
> > -		if (mode != SCAN_DISCOVERY)
> > +		if (mode != SCAN_DISCOVERY) {
> > +			trace_scmi_tlm_access(de_id, "DE_INVALID", 0, 0);
> >  			return;
> > +		}
> >  
> >  		/* In SCAN_DISCOVERY mode we allocate new DEs for unknown IDs */
> >  		tde = scmi_telemetry_tde_get(ti, de_id);
> > @@ -1462,6 +1471,8 @@ static void scmi_telemetry_tdcf_data_parse(struct telemetry_info *ti,
> >  		tde->last_ts = tstamp;
> >  	else
> >  		tde->last_ts = 0;
> > +
> > +	trace_scmi_tlm_collect(0, tde->de.info->id, tde->last_val, "SHMTI_DE_UPDT");
> 
> tde->last_ts instead of 0?
>

Yes, but I have reworked a lot the code so the traces also are moved
around a lot with different tags...also I move the trace definitions
before the protocol series in V3 and scattered the trace calls all
across the protocol patches, which I split a lot.
 
I tried anyway to follow your advice...well..anyway I doubt V3 will be
the last one :P, so you're welcome to complain...

> >  }
> >  
> >  static int scmi_telemetry_tdcf_line_parse(struct telemetry_info *ti,
> > @@ -1507,8 +1518,10 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
> >  		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
> >  
> >  		startm = TDCF_START_SEQ_GET(tdcf);
> > -		if (IS_BAD_START_SEQ(startm))
> > +		if (IS_BAD_START_SEQ(startm)) {
> > +			trace_scmi_tlm_access(0, "MSEQ_BADSTART", startm, 0);
> >  			continue;
> > +		}
> >  
> >  		/* On a BAD_SEQ this will be updated on the next attempt */
> >  		shmti->last_magic = startm;
> > @@ -1520,18 +1533,25 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
> >  
> >  			used_qwords = scmi_telemetry_tdcf_line_parse(ti, next,
> >  								     shmti, mode);
> > -			if (qwords < used_qwords)
> > +			if (qwords < used_qwords) {
> > +				trace_scmi_tlm_access(PAYLD_ID(next),
> > +						      "BAD_QWORDS", startm, 0);
> >  				return -EINVAL;
> > +			}
> >  
> >  			next += used_qwords * 8;
> >  			qwords -= used_qwords;
> >  		}
> >  
> >  		endm = TDCF_END_SEQ_GET(eplg);
> > +		if (startm != endm)
> > +			trace_scmi_tlm_access(0, "MSEQ_MISMATCH", startm, endm);
> >  	} while (startm != endm && --retries);
> >  
> > -	if (startm != endm)
> > +	if (startm != endm) {
> > +		trace_scmi_tlm_access(0, "TDCF_SCAN_FAIL", startm, endm);
> >  		return -EPROTO;
> > +	}
> >  
> >  	return 0;
> >  }
> > @@ -1923,6 +1943,8 @@ static void scmi_telemetry_scan_update(struct telemetry_info *ti, u64 ts)
> >  			tde->last_ts = tstamp;
> >  		else
> >  			tde->last_ts = 0;
> > +
> > +		trace_scmi_tlm_collect(ts, tde->de.info->id, tde->last_val, "FC_UPDATE");
> 
> tde->last_ts instead of ts?

Yes...but a lot of rework as said above...

> 
> >  	}
> >  }
> >  
> > @@ -2001,8 +2023,11 @@ static int scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
> >  		fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * 1000);
> >  
> >  		startm = TDCF_START_SEQ_GET(tdcf);
> > -		if (IS_BAD_START_SEQ(startm))
> > +		if (IS_BAD_START_SEQ(startm)) {
> > +			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_BADSTART",
> > +					      startm, 0);
> >  			continue;
> > +		}
> >  
> >  		/* Has anything changed at all at the SHMTI level ? */
> >  		scoped_guard(mutex, &tde->mtx) {
> > @@ -2018,11 +2043,16 @@ static int scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
> >  		if (DATA_INVALID(payld))
> >  			return -EINVAL;
> >  
> > -		if (IS_BLK_TS(payld))
> > +		if (IS_BLK_TS(payld)) {
> > +			trace_scmi_tlm_access(tde->de.info->id,
> > +					      "BAD_DE_META", 0, 0);
> >  			return -EINVAL;
> > +		}
> >  
> > -		if (PAYLD_ID(payld) != tde->de.info->id)
> > +		if (PAYLD_ID(payld) != tde->de.info->id) {
> > +			trace_scmi_tlm_access(tde->de.info->id, "DE_INVALID", 0, 0);
> >  			return -EINVAL;
> > +		}
> >  
> >  		/* Data is always valid since NOT handling BLK TS lines here */
> >  		*val = LINE_DATA_GET(&payld->l);
> > @@ -2046,10 +2076,16 @@ static int scmi_telemetry_tdcf_de_parse(struct telemetry_de *tde,
> >  		}
> >  
> >  		endm = TDCF_END_SEQ_GET(tde->eplg);
> > +		if (startm != endm)
> > +			trace_scmi_tlm_access(tde->de.info->id, "MSEQ_MISMATCH",
> > +					      startm, endm);
> >  	} while (startm != endm && --retries);
> >  
> > -	if (startm != endm)
> > +	if (startm != endm) {
> > +		trace_scmi_tlm_access(tde->de.info->id, "TDCF_DE_FAIL",
> > +				      startm, endm);
> >  		return -EPROTO;
> > +	}
> >  
> >  	guard(mutex)(&tde->mtx);
> >  	tde->last_magic = startm;
> > @@ -2230,6 +2266,9 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
> >  			tde->last_ts = LINE_TSTAMP_GET(&payld->tsl);
> >  		else
> >  			tde->last_ts = 0;
> > +
> > +		trace_scmi_tlm_collect(timestamp, tde->de.info->id, tde->last_val,
> > +				       "MESSAGE");
> 
> tde->last_ts instead of timestamp? If I understand correctly, tde->last_ts
> corresponds to the time coming from the platform. We have kernel time anyway
> coming from ftrace format.

Yes good point...timestamp is the time of arrival of the
notification...I can also drop that parameter at this point...

Thanks a lot for reviewing !
Cristian

