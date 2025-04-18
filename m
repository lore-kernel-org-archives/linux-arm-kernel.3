Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49218C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 12:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGm94WkSvEKAT80t6SgDIndlW5MDyMlulTb0cPlczvI=; b=Sm2g/bTX9AjG6s4TeqAG+yVocb
	9eZCaJeD+PGGy2s+HwLLJ2V+jVRTZDwDGCDUNW+6+LnH9qi57QALDodCWTWTFkP+hNb6C9VdQ3+2T
	PHoXGdECp3/RmkNsyNH2WrNlQkJcNY7mjGJ8vIeXZLk3qP90zkWk6AhAMHiHg1DKbnolBA1XoR4ZM
	aCxSPFKH3kSfIQLDU3eekk/kMvhzs2ESgYL2p7BpvR6FZ2up8D8Cq6UOzDIlSOP+ifYHYATKBgoxt
	Dguv12tqckJu88CsshMLnFvfRu1EPPsq/Q5Q5MV3uV17KzXHV4cJMR7SjIINd2NfHvjA8E5IrpVhJ
	5JUTgOhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lBV-0000000G84Q-2Y5T;
	Fri, 18 Apr 2025 12:51:09 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5l9b-0000000G7mw-33Ca
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 12:49:12 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e8484bb895so525205a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 05:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744980550; x=1745585350; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hGm94WkSvEKAT80t6SgDIndlW5MDyMlulTb0cPlczvI=;
        b=k8PwP1dtM9JLWbrsQzpx5lwEcVcklEgPQWgX0M2EoupF1O/QIfGpBDib5KH1dS8hIC
         bH3AkslZ4frWRxcj4z8Yuk0z1vxM6DzNftB9vo4Cq5qov/T0s9F2KbG1d352Yy2nGVDU
         Tru4xl3d/2vP3cjrG7UDXU3J+Am3YeUN322UUdEoP9HIUqtvaZk3vJ63w6m7iL4HRHwj
         GzvQU5I0EI6gA8xQpaVbwh1DSvKStGHhEkRuQDNHYkwwnf4OfX6pfJ2IlJH1VFgAzamh
         +/LbA1X8tWsW1PjiQvaJPIuO1uuaJEdrdKc6SOphpg5YcF0CBTtoLZtmj3G1//Et7BPG
         FJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980550; x=1745585350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGm94WkSvEKAT80t6SgDIndlW5MDyMlulTb0cPlczvI=;
        b=i535t4wMAA6TV/re6HckQmfbYlRE7+HR7caQd6EFa2IkHMaZyvZBewrEGn1qabieLn
         63k46LCewYgZv30ifOryLhyamH/ThQaawfop/5ZZP6AXVKyzHWuspp4n/kp+I6GhDqZN
         dMNHYV98jbC1qPKO2dTxRUkCJeDRCiJsCvb21+qNL193jSgO6YtOZ3r9CB6p4mdJzo5Z
         jBQJSC6noQqb4A8xoH/VKQkmnSrdMZpQmj8FO8T+xTdtZ3LoYRRY2g2Am+EMcHKYZBy0
         10W4iACW9h++pKRCDHbp/wJfDOXU9nvoQqFRsPoaj9baAC4wi5Ff40UfmxVANPGxrNh+
         6R4A==
X-Forwarded-Encrypted: i=1; AJvYcCVM8ylUpAZHjTTAMcwASTFJgK7DfOGIN3hfBB5Kek8G9X8mFdK2NeFImdLsXcD3nWLbOItn7U4OF8OqcaUjyln3@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhw8wQylcjwxLGqLGrN3CBpUiphhgqTyjS/OscGiVQ9rcvVK84
	2Kwe8W53k2vbi+lsNbo9qJ2I4Bay9tCrSWIrcZb/jcl6ohEIGMKI
X-Gm-Gg: ASbGncv23HdmTfxOewxIYSDmZYRSdaKmQx3xzcTszoCdHzsWKnh7+xWECa38Oi01St2
	vJ1CDmyCkEm9C7P0obR1Er8Z0rWqfJukIZrfhVAkH4LU7d7RNBnfYB2/RFR5OazwXm1E2nD198H
	FdTYaPhSV35HjMsx9FxhYxq0FAMQBf5GVcqrzXcSET230iB370q7MbvgvpWaBrVivkxPpmg0m1D
	+mIS1t8QtQDMu7uhf0lG4Gu+zX3G/L19IJphvKon/9xdo9trYR+QabmYlHGeWJFmINQWbaTYqBp
	XJHdzNvUNetGqGm07Kq6qm1y4q7s
X-Google-Smtp-Source: AGHT+IGQJTO3hkOdi85KfZDP/WxTdVuBNdKLUzFgqgk61QYUOpAZhlXhZ2rXm1sjvZVBwnt5nJWcHg==
X-Received: by 2002:a05:6402:3513:b0:5e0:803c:242a with SMTP id 4fb4d7f45d1cf-5f62860d4afmr803363a12.8.1744980549365;
        Fri, 18 Apr 2025 05:49:09 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efadd0asm117605366b.175.2025.04.18.05.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:49:08 -0700 (PDT)
Date: Fri, 18 Apr 2025 15:49:05 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <20250418124905.2jve2cjzrojjwmyh@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-2-wei.fang@nxp.com>
 <20250411095752.3072696-2-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411095752.3072696-2-wei.fang@nxp.com>
 <20250411095752.3072696-2-wei.fang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_054911_772376_641FCC6C 
X-CRM114-Status: GOOD (  33.09  )
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

I see this is "Changes requested", so here are some more nitpicks from me.

On Fri, Apr 11, 2025 at 05:57:39PM +0800, Wei Fang wrote:
> Some NETC functionality is controlled using control messages sent to the
> hardware using BD ring interface with 32B descriptor similar to transmit
> BD ring used on ENETC. This BD ring interface is referred to as command
> BD ring. It is used to configure functionality where the underlying
> resources may be shared between different entities or being too large to
> configure using direct registers. Therefore, a messaging protocol called
> NETC Table Management Protocol (NTMP) is provided for exchanging
> configuration and management information between the software and the
> hardware using the command BD ring interface.
> 
> For i.MX95, NTMP has been upgraded to version 2.0, which is incompatible
> with LS1028A, because the message formats have been changed.

Can you please add one more sentence clarifying that the LS1028A
management protocol has been retroactively named NTMP 1.0 and its
implementation is in enetc_cbdr.c and enetc_tsn.c? The driver, like new
NETC documentation, refers to NTMP 2.0 as simply "NTMP".

> Therefore, add the netc-lib driver to support NTMP 2.0 to operate various tables.
> Note that, only MAC address filter table and RSS table are supported at
> the moment. More tables will be supported in subsequent patches.
> 
> It is worth mentioning that the purpose of the netc-lib driver is to
> provide some NTMP-based generic interfaces for ENETC and NETC Switch
> drivers. Currently, it only supports the configurations of some tables.
> Interfaces such as tc flower and debugfs will be added in the future.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
> +static int netc_xmit_ntmp_cmd(struct ntmp_user *user, union netc_cbd *cbd)
> +{
> +	union netc_cbd *cur_cbd;
> +	struct netc_cbdr *cbdr;
> +	int i, err;
> +	u16 status;
> +	u32 val;
> +
> +	/* Currently only i.MX95 ENETC is supported, and it only has one
> +	 * command BD ring
> +	 */
> +	cbdr = &user->ring[0];
> +
> +	spin_lock_bh(&cbdr->ring_lock);
> +
> +	if (unlikely(!netc_get_free_cbd_num(cbdr)))
> +		netc_clean_cbdr(cbdr);
> +
> +	i = cbdr->next_to_use;
> +	cur_cbd = netc_get_cbd(cbdr, i);
> +	*cur_cbd = *cbd;
> +	dma_wmb();
> +
> +	/* Update producer index of both software and hardware */
> +	i = (i + 1) % cbdr->bd_num;
> +	cbdr->next_to_use = i;
> +	netc_write(cbdr->regs.pir, i);
> +
> +	err = read_poll_timeout_atomic(netc_read, val, val == i,
> +				       10, NETC_CBDR_TIMEOUT, true,

Please create a #define for NETC_CBDR_SLEEP_US too.

> +				       cbdr->regs.cir);
> +	if (unlikely(err))
> +		goto cbdr_unlock;
> +
> +	dma_rmb();
> +	/* Get the writeback command BD, because the caller may need
> +	 * to check some other fields of the response header.
> +	 */
> +	*cbd = *cur_cbd;
> +
> +	/* Check the writeback error status */
> +	status = le16_to_cpu(cbd->resp_hdr.error_rr) & NTMP_RESP_ERROR;
> +	if (unlikely(status)) {
> +		err = -EIO;
> +		dev_err(user->dev, "Command BD error: 0x%04x\n", status);
> +	}
> +
> +	netc_clean_cbdr(cbdr);
> +	dma_wmb();
> +
> +cbdr_unlock:
> +	spin_unlock_bh(&cbdr->ring_lock);
> +
> +	return err;
> +}
> +
> +static int ntmp_alloc_data_mem(struct ntmp_dma_buf *data, void **buf_align)
> +{
> +	void *buf;
> +
> +	buf = dma_alloc_coherent(data->dev, data->size + NTMP_DATA_ADDR_ALIGN,
> +				 &data->dma, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	data->buf = buf;
> +	*buf_align = PTR_ALIGN(buf, NTMP_DATA_ADDR_ALIGN);
> +
> +	return 0;
> +}
> +
> +static void ntmp_free_data_mem(struct ntmp_dma_buf *data)
> +{
> +	dma_free_coherent(data->dev, data->size + NTMP_DATA_ADDR_ALIGN,
> +			  data->buf, data->dma);
> +}
> +
> +static void ntmp_fill_request_hdr(union netc_cbd *cbd, dma_addr_t dma,
> +				  int len, int table_id, int cmd,
> +				  int access_method)
> +{
> +	dma_addr_t dma_align;
> +
> +	memset(cbd, 0, sizeof(*cbd));
> +	dma_align = ALIGN(dma, NTMP_DATA_ADDR_ALIGN);
> +	cbd->req_hdr.addr = cpu_to_le64(dma_align);
> +	cbd->req_hdr.len = cpu_to_le32(len);
> +	cbd->req_hdr.cmd = cmd;
> +	cbd->req_hdr.access_method = FIELD_PREP(NTMP_ACCESS_METHOD,
> +						access_method);
> +	cbd->req_hdr.table_id = table_id;
> +	cbd->req_hdr.ver_cci_rr = FIELD_PREP(NTMP_HDR_VERSION,
> +					     NTMP_HDR_VER2);
> +	/* For NTMP version 2.0 or later version */
> +	cbd->req_hdr.npf = cpu_to_le32(NTMP_NPF);
> +}
> +
> +static void ntmp_fill_crd(struct ntmp_cmn_req_data *crd, u8 tblv,
> +			  u8 qa, u16 ua)
> +{
> +	crd->update_act = cpu_to_le16(ua);
> +	crd->tblv_qact = NTMP_TBLV_QACT(tblv, qa);
> +}
> +
> +static void ntmp_fill_crd_eid(struct ntmp_req_by_eid *rbe, u8 tblv,
> +			      u8 qa, u16 ua, u32 entry_id)
> +{
> +	ntmp_fill_crd(&rbe->crd, tblv, qa, ua);
> +	rbe->entry_id = cpu_to_le32(entry_id);
> +}
> +
> +static int ntmp_delete_entry_by_id(struct ntmp_user *user, int tbl_id,
> +				   u8 tbl_ver, u32 entry_id, u32 req_len,
> +				   u32 resp_len)
> +{
> +	struct ntmp_dma_buf data = {.dev = user->dev};
> +	struct ntmp_req_by_eid *req;
> +	union netc_cbd cbd;
> +	u32 len;
> +	int err;
> +
> +	data.size = req_len >= resp_len ? req_len : resp_len;

max(req_len, resp_len)

It can also be placed as part of the "data" initializer:

	struct ntmp_dma_buf data = {
		.dev = user->dev,
		.size = max(req_len, resp_len),
	};

> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	ntmp_fill_crd_eid(req, tbl_ver, 0, 0, entry_id);
> +	len = NTMP_LEN(req_len, resp_len);
> +	ntmp_fill_request_hdr(&cbd, data.dma, len, tbl_id,
> +			      NTMP_CMD_DELETE, NTMP_AM_ENTRY_ID);
> +
> +	err = netc_xmit_ntmp_cmd(user, &cbd);
> +	if (err)
> +		dev_err(user->dev, "Delete table (id: %d) entry failed: %pe",
> +			tbl_id, ERR_PTR(err));

Could you also print the entry_id?

> +
> +	ntmp_free_data_mem(&data);
> +
> +	return err;
> +}
> +
> +static int ntmp_query_entry_by_id(struct ntmp_user *user, int tbl_id,
> +				  u32 len, struct ntmp_req_by_eid *req,
> +				  dma_addr_t dma, bool compare_eid)
> +{
> +	struct device *dev = user->dev;
> +	struct ntmp_cmn_resp_query *resp;
> +	int cmd = NTMP_CMD_QUERY;
> +	union netc_cbd cbd;
> +	u32 entry_id;
> +	int err;
> +
> +	entry_id = le32_to_cpu(req->entry_id);
> +	if (le16_to_cpu(req->crd.update_act))
> +		cmd = NTMP_CMD_QU;
> +
> +	/* Request header */
> +	ntmp_fill_request_hdr(&cbd, dma, len, tbl_id, cmd, NTMP_AM_ENTRY_ID);
> +	err = netc_xmit_ntmp_cmd(user, &cbd);
> +	if (err) {
> +		dev_err(dev, "Query table (id: %d) entry failed: %pe\n",
> +			tbl_id, ERR_PTR(err));

Could you print a string representation of the tbl_id instead? It should
be more user-friendly if something fails.

static const char *ntmp_table_name(enum ntmp_tbl_id tbl_id)
{
	switch (tbl_id) {
	case NTMP_MAFT_ID:
		return "MAC Address Filtering";
	case NTMP_RSST_ID:
		return "RSS";
	default:
		return "unknown";
	}
}

Also, similar comment about entry_id being absent here.

> +		return err;
> +	}
> +
> +	/* For a few tables, the first field of their response data is not
> +	 * entry_id, so directly return success.
> +	 */
> +	if (!compare_eid)
> +		return 0;
> +
> +	resp = (struct ntmp_cmn_resp_query *)req;
> +	if (unlikely(le32_to_cpu(resp->entry_id) != entry_id)) {
> +		dev_err(dev, "Table (id: %d) query EID: 0x%x, response EID: 0x%x\n",
> +			tbl_id, entry_id, le32_to_cpu(resp->entry_id));
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int ntmp_maft_add_entry(struct ntmp_user *user, u32 entry_id,
> +			struct maft_entry_data *maft)
> +{
> +	struct ntmp_dma_buf data = {.dev = user->dev};
> +	struct maft_req_add *req;
> +	union netc_cbd cbd;
> +	int err;
> +
> +	data.size = sizeof(*req);

Same comment about wrapping this into the struct initializer.

> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	/* Set mac address filter table request data buffer */
> +	ntmp_fill_crd_eid(&req->rbe, user->tbl.maft_ver, 0, 0, entry_id);
> +	req->keye = maft->keye;
> +	req->cfge = maft->cfge;
> +
> +	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(data.size, 0),
> +			      NTMP_MAFT_ID, NTMP_CMD_ADD, NTMP_AM_ENTRY_ID);
> +	err = netc_xmit_ntmp_cmd(user, &cbd);
> +	if (err)
> +		dev_err(user->dev, "Add MAFT entry failed (%pe)\n",
> +			ERR_PTR(err));
> +
> +	ntmp_free_data_mem(&data);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(ntmp_maft_add_entry);
> +
> +int ntmp_maft_query_entry(struct ntmp_user *user, u32 entry_id,
> +			  struct maft_entry_data *maft)
> +{
> +	struct ntmp_dma_buf data = {.dev = user->dev};
> +	struct maft_resp_query *resp;
> +	struct ntmp_req_by_eid *req;
> +	int err;
> +
> +	data.size = sizeof(*resp);

Same comment about struct initializer.

> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	ntmp_fill_crd_eid(req, user->tbl.maft_ver, 0, 0, entry_id);
> +	err = ntmp_query_entry_by_id(user, NTMP_MAFT_ID,
> +				     NTMP_LEN(sizeof(*req), data.size),
> +				     req, data.dma, true);
> +	if (err)
> +		goto end;
> +
> +	resp = (struct maft_resp_query *)req;
> +	maft->keye = resp->keye;
> +	maft->cfge = resp->cfge;
> +
> +end:
> +	ntmp_free_data_mem(&data);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(ntmp_maft_query_entry);

